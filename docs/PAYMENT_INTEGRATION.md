# NamMath AS — N$30 Payment Integration Plan

**Not enabled. No transactions have been processed.**

## Product definition

- SKU: `nammath_as_memo_30d`
- Price: **N$30.00** (NAD 30, **3000 cents**), one-off **30-day entitlement**.
- Entitlement activates only on verified payment and expires automatically after 30 days. New payment may extend an existing pass from its current expiry when the backend applies the purchase policy.
- Renewal is manual unless an approved gateway and explicit recurring-consent flow are later added.
- Public questions are free; complete worked memorandums are behind paid access.

## PayToday Namibia: candidate provider

PayToday's published web integration documentation describes merchant account credentials (`shopKey`, `shopHandle`, `privateKey`) and SDK payment intents for web apps. Merchant onboarding and credential issuance are required, and their guide says its testing environment **does not provide a no-charge sandbox**, meaning test transactions may move real money.

Guide: https://site.paytoday.com.na/help-center/custom-web-integrations/

### Critical warning

Some examples in PayToday's guide instantiate the SDK with merchant keys in client JavaScript; *do not put private keys in NamMath's public web code*. Before implementation, confirm a PayToday-approved, server-side payment-intent / reconciliation mechanism with the provider. The provider's guide explicitly does not document full transaction reconciliation. A redirect with `status=success` must **never** grant a memorandum entitlement. If the provider cannot support verified server-side payment confirmation, use an alternative provider or a securely administered manual payment-approval workflow.

## Required integration endpoints (design only)

1. Authenticated learner selects N$30 pass → internal backend generates unique checkout request bound to the learner ID and fixed price, never trusting the browser's amount.
2. Server creates payment intent through merchant-approved API, keeping private credentials only in server secrets.
3. Learner completes payment on the provider's secure hosted page.
4. Trusted server reconciles transaction result using a verified callback or server-to-server provider status check.
5. Idempotent payment event stored in `nammath_private.nammath_payment_events` by `(gateway, gateway_payment_id)`.
6. Transactionally insert or extend the learner's `nammath_entitlements` row with UTC timestamps. Refunds/reversals must revoke access as appropriate.
7. Learner returns to NamMath, refreshes membership, and can open protected memos. No entitlement is ever inserted by browser code.

## Merchant inputs required before implementation

- Registered merchant account and approved production/test procedure.
- Confirmed secure server-to-server API endpoints and callback verification method.
- Fees and settlement currency/amount precision.
- HTTPS production domain / callback URLs.
- Customer support and refund policy.

These credentials should be configured in Supabase secrets or another secure server key vault, never pasted into chats or public repos.
