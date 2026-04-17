# Union

Sean's one professional venture. **Founder and CEO since inception.** Company is 7 years old (founded ~2018–2019; exact date **[confirm]**).

Multi-tenant SaaS wellness platform. Codename: **bliss** (the Union product codebase). **ICP: yoga studios, fitness centers, dance studios** (per Maya plan — authoritative). The "first-responders" framing on Sean's LinkedIn is stale copy; should be corrected there.

## Strategic frame
**Turnaround / growth reacceleration.** Not a greenfield startup. The job is to unstick a 7-year-old, $1M-ARR SaaS whose growth has stalled.

## Mission
Wellness SaaS serving yoga studios, fitness centers, and dance studios. First-responders framing from LinkedIn is stale — Sean confirmed 2026-04-16 the Maya plan's ICP is the real one.

## Stage
- **Age:** 7 years (founded ~2018–2019).
- **ARR:** $1M.
- **Growth:** stalled — the central problem.
- **Sean's tenure:** Founder & CEO since inception.
- **Funding:** **[intake]**
- **Team size:** 2 humans total — Sean (CEO, effectively also product/eng/GTM) + **Katy Strot** (CX and Account Management, `people/katy-strot.md`).

## Current professional focus (not boxed to 30 days)
**Stand up the GTM function via Maya, done right.**

Decision 2026-04-16: Sean explicitly decoupled this from a 30-day box. *"Proceed with haste but do it right instead of skipping steps."* Operating principle for the Maya build: quality > deadline. Progress tracked weekly in the Friday wrap rather than against a fixed finish line.

Latent success criteria (no date — unblocked when Maya is right):
1. Maya running in a recurring loop (Solid Queue / `config/recurring.yml`).
2. Slack alerts live.
3. GTM efforts close at least one **Studio plan** ($349/mo) sale.

## 90-day north star
**[intake]**

## Team
Two people total.
- **Sean Porter** — Founder & CEO. Effectively also product, eng, and GTM owner.
- **Katy Strot** — CX & Account Management. See `people/katy-strot.md`.

## Biggest unlock
**[intake]**

## Current blockers
**[intake]**

## Why this is personal
**[intake]** Handle with awareness once articulated.

## Key metrics pal should track
- **From Maya (when online):** marketing KPIs per channel (GA4, Meta, HubSpot), cross-channel performance, alert status.
- **From Union/bliss directly:** realtime biz metrics — Sean to wire API endpoints for pal-direct consumption **after intake completes**. Separate pipe from Maya.
- **Manual until then:** ARR, Studio plan conversions, growth rate.

## Systems
- **bliss** — the Union product codebase.
- **Maya** — AI marketing intelligence + automation agent. Separate Rails 8.1 app at `~/git/maya` (repo `superset-labs/maya`). Integrates GA4, Meta Ads, HubSpot, GSuite, Slack, Cloudflare. See Maya's `AGENTS.md` and `doc/context/maya_plan.md` for scope.
- **Union → Maya dependency.** Activation/retention/churn data requires bliss to expose Doorkeeper OAuth2 endpoints — scoped as a separate task in bliss (not yet done, per Maya's AGENTS.md).

## bliss shipping pipeline (tracked in `commitments/open.md`)
- **2026-04-23** — ship **Stripe sub-accounts** in bliss.
- **2026-04-30** — ship **Marketing Automation v1** inside bliss, **replacing customer.io** for marketing. (Transactional sends remain on customer.io — see cost-cutting workstream below.)

*Note: Sean is solo dev on bliss; Katy is CX/AM. Both dates are tight. These commitments implicitly gate any serious forward motion on Maya through end of April — logged as context, not a pushback.*

## Cost-cutting workstream (rolling; summary in `commitments/open.md`)

Articulated by Sean at intake 2026-04-16. Overall target window / savings target: **[intake]**.

- [ ] **Consolidate observability on Sentry.** Migrate all Union projects (including apps) off **Scout** (APM) and **Rollbar** (errors). Retire both subscriptions.
- [ ] **Move fitreport and matrat** to **[intake: migration target unclear — consolidate onto Sentry too, or different consolidation?]**.
- [ ] **Keep customer.io for transactional email only.** Marketing moves to the in-house bliss MA feature.
- [ ] **Receive customer.io subscription webhooks** (sync customer.io list state with bliss billing).
- [ ] **Add customer.io segment rules in bliss billing.**
- [ ] **Video-billing customer cleanup.** Find customers on legacy video billing; convert them to a current plan or revoke access. **[intake: deadline + who runs outreach (Sean or Katy)?]**
- [ ] **Complete imgix → Cloudfront switch.** Migration already in flight.

## Decisions pending
- *(none tracked yet)*

## Recent wins
- *(none tracked yet)*

## Pal notes
- **2026-04-16.** Sean confirmed Union is the *single* professional venture. Prior pal sessions fabricated a parallel "CEOCx" venture from bad LinkedIn inference — scrubbed from repo, CLAUDE.md, resume summary, and auto-memory.
