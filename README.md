# NamMath AS v0.4 — Typeset Mathematics with KaTeX

**Your Equation to Success.** An independent Namibian NSSCAS Mathematics preparation app. Gold, ivory and charcoal branding inspired by a familiar school-textbook colour palette; no reproduction of that textbook's copyrighted content.

## What's new in 0.4

- **KaTeX engine (MIT 0.16.27):** bundled JavaScript and CSS for inline `\( ... \)` and block `$$ ... $$` typesetting in study notes. Fractions, integrals, derivatives, exponents, subscripts, logarithms, trigonometry, 3-D vectors and matrices display as mathematics, not unformatted Unicode text.
- **108 mathematical expressions** have been converted and validated across all 15 topic notes (formulas and worked examples). Invalid LaTeX is flagged during editing and cannot be saved until corrected.
- **Content Studio live preview:** see the typeset notes while editing; one-tap LaTeX insertions for fractions, integrals, powers and matrices. Content is escaped before typesetting, and KaTeX's `trust` option is disabled.
- **Offline-ready rendering engine:** bundled KaTeX JS + CSS; fonts are externally loaded from jsDelivr and require connectivity unless they have previously been cached by the browser. Font binaries are intentionally not included in this distribution.
- **Backwards-compatible database update:** `202610260005_nammath_katex_notes.sql` upgrades only unmodified seeded notes, preserving teacher edits; no production changes performed.

## Previous features retained (v0.3)

- **Past Papers:** permanent **2021–2025**, **Mathematics 1 and Mathematics 2** catalogue (10 slots). Each year/paper has a **clean PDF** and a separate **premium worked memo** slot. No PDF is claimed to be uploaded before it exists.
- **Regional Mock Exams:** create **2026 regional mock** entries by adding a region/identifier, Paper 1 or 2, clean PDF and a separate memo; entries appear in the learner directory after uploading.
- **Original Study Notes:** AI-prepared, teacher-editable condensed notes for all 15 syllabus topics: concept summary, key formulas, worked mini example, exam tip, and common mistake. Nine in Mathematics 1 and six in Mathematics 2. Drafts need teacher review; they are not copied from the referenced textbook.
- **Content Studio:** owner/admin PDF upload form and topic notes editor. Offline preview saves PDFs to this browser (IndexedDB if available, otherwise current tab only) and edits locally. A browser preview cannot publish to other learners.
- **Backend staging code:** new isolated `nammath_library`, `nammath_notes`, `nammath_admins` tables; a private Supabase Storage bucket; prepared admin-only signed-PDF uploads; and short-lived signed views that verify an active subscription before exposing a memo.
- Existing 45 original sample MCQs, topic practice, mini mocks, progress, account UI and N$30/30-day premium mockup from v0.2 are retained.

## Downloadable versions

- **NamMath-AS-v0.4-Interactive-Preview.html**: single HTML file (can be opened directly); **no hosting required** to inspect the new library, notes and local-content editor.
- **NamMath-AS-v0.4-Complete-Source.zip**: full version 0.3 code, sample question bank, Supabase SQL migrations and Edge Functions, release documentation, and tests.
- **NamMath-AS-v0.4-Deploy-Template.zip**: deployable static site shell; strips offline demo **correct-answer keys** and contains **no premium PDF files**. Needs a configured backend and permissions before content can be used online.

## Preview locally with live module imports

```bash
python3 -m http.server 5173
```

Open http://localhost:5173 from the app directory. Or open the packaged self-contained preview. To run validations:

```bash
npm test
```

## Backend activation

**Not live.** SQL access to the previously connected NamStudy-Prep Supabase project was failing with a password-authentication error. Nothing in this v0.3 build is deployed to the production database or payment system. Do not modify the main app without a backup and a staging review.

Review `docs/CONTENT_LIBRARY.md`, then apply the v0.2 migrations first and v0.3 migrations `202610260003_nammath_library.sql` and `202610260004_nammath_notes_seed.sql`, then v0.4 migration `202610260005_nammath_katex_notes.sql` in order. The new admin account requires an explicit Supabase Auth UUID grant by an authorised administrator; no public account can self-enrol as admin. Deploy `nam-math-library-admin` with JWT verification **true** and `nam-math-document` with JWT verification **false**, because it serves clean papers to guests and authenticates memo views itself. Both functions require audit/testing before release.

N$30 payments are **not wired to a payment gateway**. Do not activate checkout until real server-to-server transaction verification and entitlement issuance are operational.

## Media/IP/security limitations

The user has not supplied any 2021–2025 PDF papers, worked memos, or regional exam PDFs in this particular build. The 10 national slots and regional upload UI are ready; PDFs are not bundled. Make sure distribution rights exist for each paper/memo.

The browser can never reliably stop screenshots. A visible watermark and short-lived links are deterrents, not DRM. Although private Storage and server-side entitlements protect against ordinary direct downloads without authorization, an authorised learner can still save or photograph PDF content.

Teacher-review the AI study notes against the current NSSCAS syllabus and solve/check examples before public exam use.

## Official syllabus reference

NIED NSSCAS Mathematics 8227 syllabus: https://www.nied.edu.na/assets/documents/02Syllabuses/05SeniorSecondary/Mathematics/8227_NSSCAS_Mathematics_final_updated_20_November_2020.pdf

## LaTeX authoring examples

- Inline: `\(x^2+1\)`
- Display: `$$\frac{a}{b}$$`
- Integral: `$$\int_a^b f(x)\,\mathrm dx$$`
- Matrix: `$$\begin{pmatrix}a&b\\c&d\end{pmatrix}$$`

KaTeX is a renderer, not a mathematical correctness checker. Teacher review remains essential.
