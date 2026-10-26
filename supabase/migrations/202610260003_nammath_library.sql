-- NamMath AS v0.3: study notes, paper slots and *private* PDF library.
-- REVIEW ONLY until DB access restored and backup taken. No existing NamStudy Prep tables are changed.
-- Requires 202610260001_nammath_as.sql to be applied first.

create table if not exists public.nammath_admins (
  user_id uuid primary key references auth.users(id) on delete cascade,
  created_at timestamptz not null default now()
);
alter table public.nammath_admins enable row level security;
drop policy if exists nammath_admin_self_read on public.nammath_admins;
create policy nammath_admin_self_read on public.nammath_admins for select to authenticated
 using ((select auth.uid())=user_id);
revoke all on public.nammath_admins from anon,authenticated;
grant select on public.nammath_admins to authenticated;
-- IMPORTANT: No policy/grant permits a learner to self-assign administrator access.

create table if not exists public.nammath_notes (
  topic_id text primary key references public.nammath_topics(id) on delete cascade,
  summary text not null,
  formulas text not null,
  example text not null,
  tip text not null,
  pitfall text not null,
  published boolean not null default true,
  updated_at timestamptz not null default now(),
  updated_by uuid references auth.users(id) on delete set null,
  check (length(summary) between 1 and 6000),
  check (length(formulas) between 1 and 6000),
  check (length(example) between 1 and 6000),
  check (length(tip) between 1 and 6000),
  check (length(pitfall) between 1 and 6000)
);
alter table public.nammath_notes enable row level security;
drop policy if exists nammath_notes_read on public.nammath_notes;
create policy nammath_notes_read on public.nammath_notes for select to anon,authenticated
 using (published = true);
drop policy if exists nammath_notes_admin_read on public.nammath_notes;
create policy nammath_notes_admin_read on public.nammath_notes for select to authenticated
 using (exists (select 1 from public.nammath_admins a where a.user_id=(select auth.uid())));
drop policy if exists nammath_notes_insert on public.nammath_notes;
create policy nammath_notes_insert on public.nammath_notes for insert to authenticated
 with check (exists (select 1 from public.nammath_admins a where a.user_id=(select auth.uid())));
drop policy if exists nammath_notes_update on public.nammath_notes;
create policy nammath_notes_update on public.nammath_notes for update to authenticated
 using (exists (select 1 from public.nammath_admins a where a.user_id=(select auth.uid())))
 with check (exists (select 1 from public.nammath_admins a where a.user_id=(select auth.uid())));
revoke all on public.nammath_notes from anon,authenticated;
grant select on public.nammath_notes to anon,authenticated;
grant insert,update on public.nammath_notes to authenticated;

create table if not exists public.nammath_library (
  id uuid primary key default gen_random_uuid(),
  category text not null check (category in ('past','mock')),
  year smallint not null check (year between 2021 and 2026),
  paper smallint not null check (paper in (1,2)),
  region text not null default '',
  paper_filename text,
  paper_path text,
  memo_filename text,
  memo_path text,
  published boolean not null default true,
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now(),
  constraint nammath_library_unique unique(category,year,region,paper),
  constraint nammath_library_period check ((category='past' and year between 2021 and 2025 and region='') or (category='mock' and year=2026 and length(trim(region)) between 2 and 75)),
  constraint nammath_library_paper_metadata check ((paper_filename is null)=(paper_path is null)),
  constraint nammath_library_memo_metadata check ((memo_filename is null)=(memo_path is null))
);
alter table public.nammath_library enable row level security;
drop policy if exists nammath_library_read on public.nammath_library;
create policy nammath_library_read on public.nammath_library for select to anon,authenticated
 using (published=true);
drop policy if exists nammath_library_admin_read on public.nammath_library;
create policy nammath_library_admin_read on public.nammath_library for select to authenticated
 using (exists (select 1 from public.nammath_admins a where a.user_id=(select auth.uid())));
drop policy if exists nammath_library_admin_insert on public.nammath_library;
create policy nammath_library_admin_insert on public.nammath_library for insert to authenticated
 with check (exists (select 1 from public.nammath_admins a where a.user_id=(select auth.uid())));
drop policy if exists nammath_library_admin_update on public.nammath_library;
create policy nammath_library_admin_update on public.nammath_library for update to authenticated
 using (exists (select 1 from public.nammath_admins a where a.user_id=(select auth.uid())))
 with check (exists (select 1 from public.nammath_admins a where a.user_id=(select auth.uid())));
revoke all on public.nammath_library from anon,authenticated;
grant select on public.nammath_library to anon,authenticated;
-- Uploads/metadata writes are performed by admin-only Edge Functions (not the browser).

insert into storage.buckets (id,name,public,file_size_limit,allowed_mime_types)
 values ('nammath-library','nammath-library',false,20971520,array['application/pdf'])
 on conflict (id) do update set public=false, file_size_limit=20971520, allowed_mime_types=array['application/pdf'];
-- Intentionally NO public SELECT policy on storage.objects for this bucket.
-- Short-lived signed URLs are issued only by `nam-math-document` after checking access.
