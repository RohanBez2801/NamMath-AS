# NamMath AS v0.2 — Launch and Security Checklist

**Status:** Implementation starter / offline demo. **Not deployed to production, not ready to charge pupils.**

## What must be verified before publishing

1. **Restore database access.** The connected NamStudy-Prep Supabase project is discoverable, but its SQL API returned `28P01 password authentication failed` for both `supabase_read_only_user` and `postgres`. No production database migration has been applied. Resolve this through the Supabase connection settings/support before continuing. Do not rename, drop or alter any of the main app's existing tables.
2. **Review and apply migrations**, in order, to the *intended* Supabase project. New schemas/tables use `nammath_` prefixes; protected answers are in a non-exposed `nammath_private` schema. This is not a substitute for a staging database test.
3. **Verify the seed** contains 15 topics, 45 public questions, and 45 private solution entries. There must be no correct answers or memorandums in the `nammath_questions` rows. Review sample mathematics content manually before classroom use.
4. **Check RLS using three distinct identities**: anonymous learner, signed-in free learner, signed-in premium learner. Attempt cross-account progress/entitlement access, premium-memo retrieval without entitlement and with expired or future entitlement.
5. **Deploy the `nam-math-grade` and `nam-math-memo` Edge Functions** with user JWT verification. Ensure RPC function `public.nammath_internal_get_answer(text)` is callable only by `service_role`; do not expose `nammath_private` through Data API.
6. **Activate frontend config** using the Supabase URL and publishable key only. Never store the service-role key or any merchant private key in `config.js`, HTML, or the built frontend. For production packaging, omit local answer-bearing demo examples.
7. **Configure email sign-up and recovery**, including allowed redirect URLs at your actual HTTPS domain. Validate password-reset handling and correct account isolation after sign-out.
8. **Choose an approved payment merchant** and implement a *backend-only* payment-intent flow. Validate actual payment completion with signed webhook/server-to-server verification before writing an entitlement. Return URLs and client messages are not proof of payment. Treat repeated event IDs idempotently.
9. **Set exact commercial terms.** Current UI shows a 30-day, N$30 one-off pass. Clarify whether access renews manually or automatically before charging learners. Publish terms, privacy notice and merchant contact details (particularly as some learners may be minors).
10. **Launch on HTTPS and test on real Android phones** with slow connections. Browser/PWA screenshot prevention cannot be guaranteed. Watermarks are only a deterrent; no secure DRM is promised.

## Secure content flow

- Public API: `nammath_topics`, `nammath_questions` (no correct option or memo fields).
- User RLS: `nammath_progress`, `nammath_entitlements` (self-only and no client entitlement write).
- Protected answers: `nammath_private.nammath_answers` accessible through a service-role-only SQL RPC.
- `nam-math-grade`: authenticated user answers a question; service function returns only `{correct: true|false}`, never the key.
- `nam-math-memo`: authenticated, non-expired, **already-started** premium entitlement required; returns memorandum and account-bound watermark; `Cache-Control: no-store`.
- The frontend must never infer premium access solely from a redirect status or user-editable JWT metadata.

## Local regression checks

From the source folder:

```bash
npm test
python3 -m http.server 5173
```

Then use a browser at `http://localhost:5173`. Recommended manual tests: all 15 topic cards; all three practice questions for a topic; wrong/correct feedback; both mini mock timers and completion; suggested weak topics; progress after reload; paywall blocks memo; account recovery modal; portrait mobile widths 360px and 412px.

## Database verification examples (only after migrations, in controlled staging)

```sql
select count(*) from public.nammath_topics;             -- 15
select count(*) from public.nammath_questions;          -- 45
select count(*) from nammath_private.nammath_answers;   -- 45
select count(*) from public.nammath_entitlements;       -- must be 0 initially
```

Run the SQL tests with an admin in staging; additionally test with an anon token that private answers and entitlements cannot be retrieved. Never seed paid entitlements for a real learner merely to make a checkout demo succeed.
