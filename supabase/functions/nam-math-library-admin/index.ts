import { withSupabase } from 'npm:@supabase/server@1';

const cors = {
  'Access-Control-Allow-Origin':'*',
  'Access-Control-Allow-Headers':'authorization, x-client-info, apikey, content-type',
  'Access-Control-Allow-Methods':'POST, OPTIONS',
  'Cache-Control':'no-store',
};
const reply=(data:unknown,status=200)=>Response.json(data,{status,headers:cors});
const slug=(name:string)=>name.toLowerCase().normalize('NFD').replace(/[\u0300-\u036f]/g,'').replace(/[^a-z0-9]+/g,'-').replace(/^-|-$/g,'').slice(0,70);
const verifyParams=(v:any)=>{
  if(!['past','mock'].includes(v.category)||![1,2].includes(v.paper)||!Number.isInteger(v.year))return 'Invalid examination selection';
  if(v.category==='past'&&!(v.year>=2021&&v.year<=2025&&(!v.region||v.region==='')))return 'Past exams must be 2021–2025';
  if(v.category==='mock'&&(v.year!==2026||typeof v.region!=='string'||!/^[\p{L}\p{N} .,&'()-]{2,75}$/u.test(v.region.trim())))return 'Enter a valid 2026 regional mock identifier';
  if(!['paper','memo'].includes(v.kind))return 'Choose clean paper or memorandum';
  if(typeof v.filename!=='string'||v.filename.length>180||!v.filename.toLowerCase().endsWith('.pdf'))return 'PDF filename required';
  return null;
};
const handler=withSupabase({auth:'user'},async(req,ctx)=>{
  if(req.method!=='POST')return reply({error:'Method not allowed'},405);
  const uid=ctx.userClaims?.id;
  if(!uid)return reply({error:'Sign-in required'},401);
  const {data:admin,error:authError}=await ctx.supabaseAdmin.from('nammath_admins').select('user_id').eq('user_id',uid).maybeSingle();
  if(authError)return reply({error:'Admin list not available'},503);
  if(!admin)return reply({error:'Administrator access required'},403);
  const v=await req.json().catch(()=>({}));
  if(v.action==='status')return reply({admin:true});
  if(!['reserve','finalize'].includes(v.action))return reply({error:'Unknown action'},400);
  const invalid=verifyParams(v);if(invalid)return reply({error:invalid},400);
  const region=v.category==='mock'?v.region.trim():'';
  if(v.action==='reserve'){
    if(!Number.isInteger(v.size)||v.size<5||v.size>20971520)return reply({error:'PDF exceeds 20 MB limit'},400);
    const path=`${v.category}/${v.year}/${region?slug(region):'national'}/p${v.paper}/${v.kind}/${crypto.randomUUID()}.pdf`;
    const {data,error}=await ctx.supabaseAdmin.storage.from('nammath-library').createSignedUploadUrl(path);
    if(error||!data?.token)return reply({error:'Unable to reserve PDF upload'},503);
    return reply({token:data.token,path});
  }
  // Register a document only after its uploaded object has been found in the private bucket.
  const expectedPrefix=`${v.category}/${v.year}/${region?slug(region):'national'}/p${v.paper}/${v.kind}/`;
  if(typeof v.path!=='string'||!v.path.startsWith(expectedPrefix)||!/^[a-f0-9-]{36}\.pdf$/i.test(v.path.split('/').at(-1)||''))return reply({error:'Invalid upload path'},400);
  const pieces=v.path.split('/'),objectName=pieces.pop()!,folder=pieces.join('/');
  const {data:objects,error:listError}=await ctx.supabaseAdmin.storage.from('nammath-library').list(folder,{search:objectName,limit:10});
  if(listError||!objects?.some(o=>o.name===objectName))return reply({error:'Uploaded file not found'},409);
  const query=ctx.supabaseAdmin.from('nammath_library');
  const {data:existing,error:readError}=await query.select('*').eq('category',v.category).eq('year',v.year).eq('paper',v.paper).eq('region',region).maybeSingle();
  if(readError)return reply({error:'Unable to read catalogue entry'},503);
  const patch={category:v.category,year:v.year,region,paper:v.paper,published:true,updated_at:new Date().toISOString(),[`${v.kind}_filename`]:v.filename,[`${v.kind}_path`]:v.path};
  const {data:entry,error:saveError}=await ctx.supabaseAdmin.from('nammath_library')
    .upsert(existing?{...existing,...patch}:patch,{onConflict:'category,year,region,paper'}).select('id').single();
  if(saveError)return reply({error:'Unable to register PDF'},503);
  return reply({ok:true,id:entry.id});
});
export default {fetch(req:Request){if(req.method==='OPTIONS')return new Response(null,{status:204,headers:cors});return handler(req);}};
