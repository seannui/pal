# Open commitments

Active loops. When closed, move the row to `cos/commitments/closed.md` with the close date.

## Sean's 30-day outcomes (window: 2026-04-16 → 2026-05-16)

Captured at intake 2026-04-16.

| By | Outcome | Category | Notes |
|---|---|---|---|
| 2026-05-16 | 3 workout sessions/week sustained through the window | Personal — fitness | Weekly cadence — pal should surface if a week trends behind. |
| 2026-05-16 | 10 lbs lost (measured at window close) | Personal — fitness | Needs baseline weight to track; capture at next brief. |
| 2026-05-16 | Zero drinks — start date 2026-05-16 | Personal — health | Outcome is the **switch**, not abstinence during the window. 2026-05-16 = Day 0. |
| *no box* | Union GTM via Maya, done right | Professional — Union | Decoupled from 30 days on 2026-04-16 by Sean: *"proceed with haste but do it right instead of skipping steps."* Progress checked weekly in Friday wrap; criteria (Maya loop, Slack alerts, first Studio sale) unchanged but undated. |

## Sean owes others

| Due | To | What | Venture | Source | Notes |
|---|---|---|---|---|---|
| 2026-04-23 | Union customers / roadmap | Ship **Stripe sub-accounts** (bliss) | Union | 2026-04-16 intake | 7-day window. Solo dev effort (Sean). |
| 2026-04-30 | Union customers / roadmap | Ship **Marketing Automation v1** as a bliss feature, replacing customer.io (marketing only; customer.io stays for transactional) | Union | 2026-04-16 intake | 14-day window. In-housing what was external. Separate codebase from Maya. |
| *rolling* | Union P&L | **Cost-cutting workstream** — 7 items (Sentry consolidation, fitreport/matrat move, customer.io narrowing + webhooks + segment rules, video-billing cleanup, imgix→Cloudfront) | Union | 2026-04-16 intake | Full list + status in `cos/ventures/union.md`. Solo dev (Sean). |

## Others owe Sean

| Expected | From | What | Venture | Source | Notes |
|---|---|---|---|---|---|
| 2026-04-17 | Katy Strot | Marketing automation feedback | Union | 2026-04-16 intake | EOD 2026-04-17. Input for the MA v1 shipping sprint (due 2026-04-30). If this slips, flag the downstream risk. |

## Pending decisions (Sean owns)

| By | Decision | Owner-of-framing | Options on the table | Blockers |
|---|---|---|---|---|
| *(none tracked yet)* | | | | |

## Post-intake workstream (Sean → pal)

| When | What | Why | Status |
|---|---|---|---|
| Open | Sean wires Union (bliss) API endpoints for pal to consume realtime biz metrics + top-revenue account owners | Unlocks (a) realtime Union metrics in briefs; (b) seeding the remaining 7 `cos/people/*.md` files for main account owners by revenue. | **Open** — waiting on Sean. |
| 2026-04-17 | Pal wires scheduled rhythms — via Rails 8 + Solid Queue (not `schedule` skill; architectural upgrade Sean made mid-session) | Activates the operating cadence Sean confirmed 2026-04-16. | **✅ Done** — `config/recurring.yml` + Solid Queue, proven end-to-end 2026-04-17. Persistent via launchd (see `README.md`). |
| 2026-04-17 | Pal sets up `.env` + Keybase encrypt/decrypt following `~/git/bliss` pattern, deviation = Sean's Keybase key only | Secures any secrets pal needs. | **✅ Done** — `bin/env-encrypt` + `bin/env-decrypt`; v0.1.1 will consume `ANTHROPIC_API_KEY` via this. |
| Open (v0.1.1 next commit) | Pal swaps `PlaybookRunner` stub for a real Claude API call with prompt caching | Briefs stop being placeholders and become real outputs derived from the playbook + cos/ markdown. | **Open** — needs `ANTHROPIC_API_KEY` set in `.env`. |

---

**Conventions**
- Dates absolute: `YYYY-MM-DD`. No "next week."
- `Source`: email thread subject, calendar event title, conversation date, or `cos/inbox/` filename.
- Pal appends rows on observation; Sean edits/closes.
- Stale rows (past due with no movement) bubble up in the next brief.
