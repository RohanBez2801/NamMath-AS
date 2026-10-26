# NamMath AS v0.3 content library

## Libraries

- **Past papers:** 10 fixed slots (2021–2025 × Mathematics Paper 1/Paper 2). Each slot has independent `paper_path` and `memo_path` and corresponding filenames. A slot only reads **ready** after its actual PDF has been uploaded.
- **2026 regional mocks:** create slots as you upload each region's Paper 1/2; no uploaded regional exams or marks are fabricated.
- **Study Notes:** 15 teacher-editable, original AI-assisted topic summaries across Mathematics 1 and Mathematics 2, containing concept, formulas, mini example, exam tip and common mistake.

## Preview versus live environment

**Preview:** In Content Studio, administrators/testers can upload PDFs that remain **on this browser only** using IndexedDB. Files never reach the hosted database. The demo UI does not grant premium access to locally uploaded memos. Notes changes are saved in localStorage for testing. Learners elsewhere will see none of these local uploads.

**Live:** After verifying Supabase setup and migrations, Content Studio is visible only to administrators included in `public.nammath_admins`. Document PDFs live in the private `nammath-library` Storage bucket. An admin-only Edge Function authorises one-time signed upload tokens and verifies completion. The public catalogue only includes published document metadata; actual PDF views must receive short-lived signed URLs from `nam-math-document`, which checks active entitlements before giving a memo URL. Notes are editable only under admin RLS policies.

**Important:** A 45-second signed URL may be copied while valid. PDF viewers can still capture text, and browsers cannot block screenshots. A visible user watermark is merely a deterrent. Do not market this as DRM or guarantee that copying is impossible.

## Live enablement checklist

1. Review the migration `202610260003_nammath_library.sql`. Do not run against the current database until the failed authentication problem is resolved and a backup is taken.
2. Approve one administrator by taking that person's **actual Supabase Auth UUID** and running `insert into public.nammath_admins(user_id) values ('YOUR_AUTH_UUID');` from an authorised migration console. Never give ordinary learners admin rights.
3. Deploy `nam-math-document` with `verify_jwt=false`; it authenticates premium memo requests **inside the handler**. Deploy `nam-math-library-admin` with `verify_jwt=true` to require an admin's user JWT. (The existing `nam-math-grade`/`nam-math-memo` functions remain unchanged.)
4. Confirm Storage `nammath-library` bucket is private, 20MB size limit, `application/pdf` MIME restriction. No public Storage read policies should be added.
5. Configure frontend publishable credentials and approved Auth redirect domains, sign in as admin, test uploading a tiny PDF and checking available slots from a second browser.
6. Test the free clean paper view, unauthenticated memo rejection, free account memo rejection, expired subscription rejection, and active subscription memo view separately. Confirm none of the premium files are accessible through a public Storage URL.
7. Teacher-review the original AI-created notes and make corrections before using them for high-stakes exam prep.
8. Confirm you have rights to distribute examination papers and worked memorandums.
9. Keep paid checkout disabled until a Namibian merchant integration verifies transactions server-side.

## Limitations

This build includes no actual user-supplied exam PDFs. It also does not automatically generate summaries from uploaded papers or scan handwriting. The notes are original introductory summaries and may need depth and examples expanded before launch.
