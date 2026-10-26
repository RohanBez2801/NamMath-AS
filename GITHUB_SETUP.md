# Publishing NamMath AS to GitHub

The source tree is **ready to push**, but creating a GitHub repository and granting the connected ChatGPT GitHub app access require the owner's action if the connector lacks those capabilities.

## Recommended destination

- Owner: `RohanBez2801` (account confirmed through the GitHub connection)
- Repository name: `NamMath-AS`
- Visibility: **Private** until content ownership, premium security and payment integration have been reviewed.
- Default branch: `main`

## Fastest path

1. Open https://github.com/new while signed into your account.
2. Create a **private** repository named **NamMath-AS**. Do not add a starter README, `.gitignore`, or license, because the project already contains these items where appropriate.
3. Grant the GitHub app connected to ChatGPT permission to access this repository using GitHub **Settings → Applications → Installed GitHub Apps → Configure → Repository access**, if GitHub offers that setting for the app.
4. Return to ChatGPT and request: "Push my NamMath AS v0.4 code to RohanBez2801/NamMath-AS now." The repository must appear in the GitHub connector first.

## Alternative local push

If you have Git installed, unzip the Git-ready package, open a terminal inside its root, and run:

```bash
git init -b main
git add .
git commit -m "Initial NamMath AS v0.4 with KaTeX, papers, notes and mock exams"
git remote add origin https://github.com/RohanBez2801/NamMath-AS.git
git push -u origin main
```

Use your normal GitHub authentication; **do not paste tokens, credentials, or payment secrets into the project or this chat**.

## Before making the repository public

- Confirm no student data or merchant credentials were committed.
- Keep paid memorandums and uploaded exam PDFs out of source control; use private, permission-controlled storage and verify redistribution rights.
- Configure Supabase with a publishable client key only; never commit a service-role key.
- The backend migrations and payment service have **not** been deployed; the PWA is an in-development prototype, not a live subscription platform.
