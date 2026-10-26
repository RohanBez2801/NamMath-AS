import { withSupabase } from 'npm:@supabase/server@1';

const cors = {
  'Access-Control-Allow-Origin': '*',
  'Access-Control-Allow-Headers': 'authorization, x-client-info, apikey, content-type',
  'Access-Control-Allow-Methods': 'POST, OPTIONS',
  'Cache-Control': 'private, no-store, max-age=0',
  'Pragma': 'no-cache',
  'X-Content-Type-Options': 'nosniff',
};
const json = (body: unknown, status=200) => Response.json(body,{status,headers:cors});
const authenticated = withSupabase({auth:'user'}, async (req,ctx) => {
  if(req.method!=='POST')return json({error:'Method not allowed'},405);
  const userId=ctx.userClaims?.id;
  if(!userId)return json({error:'Authentication required'},401);
  const {questionId}=await req.json().catch(()=>({}));
  if(typeof questionId!=='string'||!/^q-[a-z0-9-]{1,80}$/.test(questionId))return json({error:'Invalid question'},400);
  // Never trust a client-side premium flag or payment success screen.
  const {data:entitlement,error:entError}=await ctx.supabaseAdmin.from('nammath_entitlements')
    .select('id,expires_at').eq('user_id',userId).eq('status','active').lte('starts_at',new Date().toISOString())
    .gt('expires_at',new Date().toISOString()).order('expires_at',{ascending:false}).limit(1).maybeSingle();
  if(entError)return json({error:'Subscription could not be verified'},503);
  if(!entitlement)return json({error:'Active N$30 subscription required'},403);
  const {data:question,error:questionError}=await ctx.supabase
    .from('nammath_questions').select('id').eq('id',questionId).eq('published',true).maybeSingle();
  if(questionError||!question)return json({error:'Question not available'},404);
  const {data:answers,error:answerError}=await ctx.supabaseAdmin.rpc('nammath_internal_get_answer',{p_question_id:questionId});
  if(answerError||!answers?.length)return json({error:'Memo unavailable'},404);
  return json({memo:answers[0].memorandum,expiresAt:entitlement.expires_at,watermark:ctx.userClaims?.email||userId});
});
export default {
  fetch(req:Request){if(req.method==='OPTIONS')return new Response(null,{status:204,headers:cors});return authenticated(req);},
};
