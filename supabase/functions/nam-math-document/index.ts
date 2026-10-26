import { withSupabase } from 'npm:@supabase/server@1';

const cors = {
  'Access-Control-Allow-Origin': '*',
  'Access-Control-Allow-Headers': 'authorization, x-client-info, apikey, content-type',
  'Access-Control-Allow-Methods': 'POST, OPTIONS',
  'Cache-Control': 'private, no-store, max-age=0',
  'X-Content-Type-Options': 'nosniff',
};
const reply = (data:unknown,status=200) => Response.json(data,{status,headers:cors});
const handle = withSupabase({auth:'none'}, async(req,ctx) => {
  if(req.method!=='POST')return reply({error:'Method not allowed'},405);
  const {resourceId,kind}=await req.json().catch(()=>({}));
  if(typeof resourceId!=='string'||!/^[0-9a-f-]{36}$/i.test(resourceId)||!['paper','memo'].includes(kind))return reply({error:'Invalid document request'},400);
  const {data:resource,error:lookupError}=await ctx.supabaseAdmin.from('nammath_library')
    .select('id,published,paper_path,memo_path').eq('id',resourceId).eq('published',true).maybeSingle();
  if(lookupError)return reply({error:'Library unavailable'},503);
  if(!resource)return reply({error:'Document not published'},404);
  const path=kind==='paper'?resource.paper_path:resource.memo_path;
  if(!path)return reply({error:'PDF not yet uploaded'},404);
  let watermark='';
  if(kind==='memo') {
    // Public endpoint because clean papers are free; memo requests are *individually* authenticated.
    const jwt=req.headers.get('authorization')?.replace(/^Bearer\s+/i,'')||'';
    if(!jwt)return reply({error:'Sign in to access premium memorandums'},401);
    const {data:userResult,error:authError}=await ctx.supabaseAdmin.auth.getUser(jwt);
    if(authError||!userResult?.user)return reply({error:'Invalid learner session'},401);
    const user=userResult.user,now=new Date().toISOString();
    const {data:access,error:accessError}=await ctx.supabaseAdmin.from('nammath_entitlements')
      .select('id').eq('user_id',user.id).eq('status','active').lte('starts_at',now).gt('expires_at',now).limit(1).maybeSingle();
    if(accessError)return reply({error:'Cannot check subscription'},503);
    if(!access)return reply({error:'Active premium subscription required'},403);
    watermark=user.email||user.id;
  }
  // Storage bucket is PRIVATE; the temporary signed URL is the only way to access a PDF.
  const {data:signed,error:signError}=await ctx.supabaseAdmin.storage.from('nammath-library').createSignedUrl(path,45);
  if(signError||!signed?.signedUrl)return reply({error:'Document currently unavailable'},503);
  return reply({url:signed.signedUrl,watermark,validSeconds:45,kind});
});
export default {fetch(req:Request){if(req.method==='OPTIONS')return new Response(null,{status:204,headers:cors});return handle(req);}};
