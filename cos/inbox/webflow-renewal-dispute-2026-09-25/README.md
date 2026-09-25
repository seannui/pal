# Webflow renewal dispute — September 25, 2026

## Current status

- Submitted to Webflow Billing through the authenticated support portal on September 25, 2026 at approximately 12:14 PM Mountain Time.
- Ticket: [#1197696](https://support.webflow.com/requests/1197696)
- Status: Escalated for manual billing review; Webflow said its team will follow up by email.
- No plan, publishing, or site-content changes were made.
- Follow-up event: October 2, 2026 from 9:00–9:30 AM Mountain Time on `sean@union.fit`'s primary Google Calendar, with an email reminder one hour before.
- Full portal transcript summary, escalation messages, calendar identifiers, and follow-up procedure: `04-support-submission-log.md`.

## Recommended sequence

1. Wait for Webflow's response to ticket #1197696, while preserving all email and portal correspondence.
2. Do not describe the charge as card theft or an unrecognized transaction. This is a disputed automatic renewal from a known merchant.
3. If Webflow denies the refund or does not respond by October 2, submit `02-card-dispute-short.txt` in the issuer's text field and attach `03-card-dispute-detailed.txt` with the evidence listed below.
4. Consider filing the same evidence with the Colorado Attorney General. Colorado gives the attorney general and district attorneys exclusive authority to enforce C.R.S. § 6-1-732.

## Tone check

Firm, factual, and escalation-ready. The drafts acknowledge Webflow's May pricing announcement so the request cannot be undermined by an accusation that no notice of any kind was sent.

## Risk

Medium. The seven-day renewal notice is outside Colorado's 25-to-40-day window, and its $276 estimate did not match the $300 charge. The observed cancellation flow also appears inconsistent with Colorado's one-step requirement. However:

- Webflow sent a general pricing notice on May 13, 2026, which disclosed the CMS-to-Premium migration and $25/month annual price. Do not claim there was no pricing notice.
- The September 18 email described $276 as an estimate and warned that the final charge could vary for taxes, discounts, and credits. Webflow may rely on that qualifier, although the receipt shows a flat $300 subscription charge rather than a tax adjustment.
- Webflow's terms and refund policy call annual renewals non-refundable. The dispute is that the renewal process did not satisfy applicable Colorado requirements, not that Webflow's published policy promises a refund.
- Webflow's terms select California law, so it may contest Colorado's application. The counterpoint is that the purchaser operates in Colorado and Colorado's business coverage applies to contracts renewed on or after February 16, 2026.
- Colorado's statute does not itself create a private enforcement action; the legal facts support a merchant resolution, issuer dispute, and attorney-general complaint.
- A chargeback may cause Webflow to restrict the account. Contact Webflow first and preserve the ticket.
- Downgrading the site plan may unpublish `learn.union.fit` and remove paid-plan capabilities. Confirm that the site may go offline or migrate it before completing a downgrade.

This is decision support, not legal advice.

## Mailbox findings

Mailbox reviewed: `sean@union.fit`, including mail forwarded from `ops@supersethq.com`.

### May 13, 2026 — general pricing announcement

- From: Webflow `<contact@hello.webflow.com>`
- To: `ops@supersethq.com`
- Subject: `We're updating our pricing and simplifying our plans`
- Gmail message ID: `19e226dddf0b0036`
- Disclosed that Webflow would combine CMS and Business into Premium, that Premium would cost $25/month billed yearly, that existing CMS customers would be migrated, and that the change would take effect on the next renewal or billable change on or after June 29, 2026.

### September 18, 2026 — site-specific renewal notice

- From: Webflow `<billing@webflow.com>`
- To: `ops@supersethq.com`
- Subject: `Your CMS plan for Union Homepage renews in 7 days`
- Gmail message ID: `1a0b568c8de32681`
- Stated that the plan would renew September 25 and that the card ending in 3868 would be charged `$276.00`.
- Called that amount an estimate and said the final charge could vary based on taxes, discounts, and credits.
- Arrived seven days before renewal. The Colorado statutory notice window was August 16 through August 31, 2026. No Webflow renewal notice was found in that window.

### September 25, 2026 — receipt

- From: Webflow `<billing@webflow.com>`
- To: `ops@supersethq.com`
- Subject: `Your Webflow receipt`
- Gmail message ID: `1a0d9ad877650f63`
- Date of charge: September 25, 2026
- Visa ending: 3868
- Amount: `$300.00`
- Description: `Subscription update`
- Receipt included an after-the-charge link explaining Webflow's 2026 plan and pricing updates.

## Account evidence

- Site: Union Homepage
- Workspace: Superset's Workspace
- Renewed plan: Premium Hosting, annual
- Renewal term: September 25, 2026 through September 25, 2027
- Charge: $300.00
- Prior annual charge: $276.00 for CMS Hosting
- Invoice number: `1790354754`
- Invoice ID: `in_0UJcFyo2ZNzxqgUAfUWX82Ib`
- Next scheduled bill shown in Webflow: $300.00 on September 25, 2027

The observed online cancellation path required selecting downgrade to Starter, passing a consequences screen, continuing to another screen, choosing a reason, and then confirming the downgrade. The consequences screen did not display a simultaneous direct final-cancel link.

## Strongest grounds

1. **Late annual-renewal notice.** C.R.S. § 6-1-732(4)(b) requires notice at least 25 and no more than 40 days before each annual automatic renewal. The site-specific notice arrived seven days before this renewal.
2. **Renewal notice did not match the charge.** The September 18 notice estimated $276; Webflow charged $300 seven days later. The earlier May announcement explains the new price, but it does not make the site-specific annual notice timely or internally accurate.
3. **One-step cancellation concern.** C.R.S. § 6-1-732(2)(d) defines compliance for an online enrollment through a one-step online cancellation link. Subsection (2.5) permits consequences or retention information only when a prominently located, continuously proximate direct cancellation link appears alongside it. The observed multi-screen Webflow flow did not appear to provide that direct link.
4. **Business coverage.** Colorado's enacted changes apply to businesses for contracts offered or renewed on or after February 16, 2026. This company operates in Colorado, and the disputed renewal occurred on September 25, 2026.

## Sources

- Colorado statute, C.R.S. § 6-1-732: <https://olls.info/crs/crs2026-title-06.htm>
- Colorado General Assembly, SB 25-145: <https://leg.colorado.gov/bills/sb25-145>
- Final fiscal note confirming business application from February 16, 2026: <https://content.leg.colorado.gov/sites/default/files/documents/2025A/bills/fn/2025a_sb145_f1.pdf>
- Colorado Attorney General's August 2026 one-step cancellation enforcement announcement: <https://coag.gov/press-releases/weiser-announces-settlement-with-cobblestone-car-wash-for-using-unfair-auto-renewal-practices/>
- Colorado Attorney General product and services complaint: <https://coag.gov/file-complaint/product-and-services/>
- Webflow refund policy: <https://help.webflow.com/hc/en-us/articles/40102090399635-Webflow-Refund-Policy>
- Webflow terms: <https://webflow.com/legal/terms>
- FTC notice explaining that the 2024 federal click-to-cancel rule was vacated: <https://www.ftc.gov/news-events/news/press-releases/2026/03/ftc-seeks-public-comment-response-advance-notice-proposed-rulemaking-regarding-negative-option>

The drafts intentionally rely on Colorado law rather than the vacated 2024 federal click-to-cancel rule.
