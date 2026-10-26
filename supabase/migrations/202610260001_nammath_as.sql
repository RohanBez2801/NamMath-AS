-- NamMath AS: isolated MVP tables. Intended for review and application to the existing
-- NamStudy-Prep project only after database access and migration review are restored.
-- Every public table has row-level security. Paid memorandums NEVER live in public tables.
create extension if not exists pgcrypto;
create schema if not exists nammath_private;
revoke all on schema nammath_private from public, anon, authenticated;

create table if not exists public.nammath_topics (
 id text primary key,
 paper smallint not null check (paper in (1,2)),
 topic_number smallint not null,
 title text not null,
 short_title text not null,
 published boolean not null default true,
 unique (paper, topic_number)
);
create table if not exists public.nammath_questions (
 id text primary key,
 topic_id text not null references public.nammath_topics(id) on delete cascade,
 prompt text not null,
 options jsonb not null check (jsonb_typeof(options)='array' and jsonb_array_length(options)=4),
 points smallint not null default 1 check(points>0),
 published boolean not null default true
);
create table if not exists nammath_private.nammath_answers (
 question_id text primary key references public.nammath_questions(id) on delete cascade,
 correct_option smallint not null check(correct_option between 0 and 3),
 memorandum text not null
);
create table if not exists public.nammath_progress (
 user_id uuid not null references auth.users(id) on delete cascade,
 question_id text not null references public.nammath_questions(id) on delete cascade,
 attempts integer not null default 0 check(attempts>=0),
 last_correct boolean not null default false,
 updated_at timestamptz not null default now(),
 primary key(user_id,question_id)
);
create table if not exists public.nammath_entitlements (
 id uuid primary key default gen_random_uuid(),
 user_id uuid not null references auth.users(id) on delete cascade,
 provider text not null default 'manual',
 status text not null check(status in ('active','expired','revoked')),
 starts_at timestamptz not null default now(),
 expires_at timestamptz not null,
 created_at timestamptz not null default now(),
 check (expires_at>starts_at)
);
create index if not exists nammath_entitlements_active_idx
 on public.nammath_entitlements(user_id,expires_at desc) where status='active';
create table if not exists nammath_private.nammath_payment_events (
 id uuid primary key default gen_random_uuid(),
 gateway text not null,
 gateway_payment_id text not null,
 user_id uuid references auth.users(id) on delete set null,
 amount_cents integer not null,
 currency text not null default 'NAD',
 status text not null,
 received_at timestamptz not null default now(),
 unique(gateway,gateway_payment_id)
);

alter table public.nammath_topics enable row level security;
alter table public.nammath_questions enable row level security;
alter table public.nammath_progress enable row level security;
alter table public.nammath_entitlements enable row level security;
alter table nammath_private.nammath_answers enable row level security;
alter table nammath_private.nammath_payment_events enable row level security;

-- Public syllabus and original practice questions only, never marking keys/memos.
drop policy if exists nammath_public_topics on public.nammath_topics;
create policy nammath_public_topics on public.nammath_topics for select to anon,authenticated using (published=true);
drop policy if exists nammath_public_questions on public.nammath_questions;
create policy nammath_public_questions on public.nammath_questions for select to anon,authenticated using (published=true);
-- Learner-owned progress.
drop policy if exists nammath_read_own_progress on public.nammath_progress;
create policy nammath_read_own_progress on public.nammath_progress for select to authenticated using ((select auth.uid())=user_id);
drop policy if exists nammath_insert_own_progress on public.nammath_progress;
create policy nammath_insert_own_progress on public.nammath_progress for insert to authenticated with check ((select auth.uid())=user_id);
drop policy if exists nammath_update_own_progress on public.nammath_progress;
create policy nammath_update_own_progress on public.nammath_progress for update to authenticated using ((select auth.uid())=user_id) with check ((select auth.uid())=user_id);
-- Learners can only read their entitlements. Payment providers/webhooks grant access server-side.
drop policy if exists nammath_read_own_entitlement on public.nammath_entitlements;
create policy nammath_read_own_entitlement on public.nammath_entitlements for select to authenticated using ((select auth.uid())=user_id);

-- RLS is NOT a substitute for database privileges. Grant only the necessary methods.
revoke all on public.nammath_topics from anon,authenticated;
revoke all on public.nammath_questions from anon,authenticated;
revoke all on public.nammath_progress from anon,authenticated;
revoke all on public.nammath_entitlements from anon,authenticated;
grant select on public.nammath_topics,public.nammath_questions to anon,authenticated;
grant select,insert,update on public.nammath_progress to authenticated;
grant select on public.nammath_entitlements to authenticated;
revoke all on all tables in schema nammath_private from anon,authenticated;

-- Private-schema data access is provided to the Edge Functions exclusively through
-- a service-role-only RPC. No client role receives EXECUTE permissions.
create or replace function public.nammath_internal_get_answer(p_question_id text)
returns table(correct_option smallint, memorandum text)
language sql stable security definer
set search_path = ''
as $$
  select a.correct_option, a.memorandum
  from nammath_private.nammath_answers as a
  where a.question_id = p_question_id;
$$;
revoke all on function public.nammath_internal_get_answer(text) from public,anon,authenticated;
grant execute on function public.nammath_internal_get_answer(text) to service_role;
