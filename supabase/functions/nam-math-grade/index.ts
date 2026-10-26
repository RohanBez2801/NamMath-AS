import { withSupabase } from 'npm:@supabase/server@1';

const cors = {
  'Access-Control-Allow-Origin': '*',
  'Access-Control-Allow-Headers': 'authorization, x-client-info, apikey, content-type',
  'Access-Control-Allow-Methods': 'POST, OPTIONS',
  'Cache-Control': 'no-store',
  'X-Content-Type-Options': 'nosniff',
};
const json = (body: unknown, status = 200) => Response.json(body, { status, headers: cors });
const authenticated = withSupabase({ auth: 'user' }, async (req, ctx) => {
  if (req.method !== 'POST') return json({ error: 'Method not allowed' }, 405);
  const { questionId, selectedOption } = await req.json().catch(() => ({}));
  if (typeof questionId !== 'string' || !/^q-[a-z0-9-]{1,80}$/.test(questionId)
    || !Number.isInteger(selectedOption) || selectedOption < 0 || selectedOption > 3) {
    return json({ error: 'Invalid question or answer' }, 400);
  }
  const { data: question, error: qerr } = await ctx.supabase
    .from('nammath_questions').select('id').eq('id', questionId).eq('published',true).maybeSingle();
  if (qerr || !question) return json({ error: 'Question not available' }, 404);
  const { data: keys, error } = await ctx.supabaseAdmin.rpc('nammath_internal_get_answer', {p_question_id:questionId});
  if (error || !keys?.length) return json({ error: 'Marking key unavailable' }, 404);
  return json({ correct: keys[0].correct_option === selectedOption });
});
export default {
  fetch(req: Request) {
    if (req.method === 'OPTIONS') return new Response(null,{status:204,headers:cors});
    return authenticated(req);
  },
};
