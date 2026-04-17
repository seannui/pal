# Runbook — monthly review

Default trigger: first Monday of each month, 7:00 MT.

## Inputs
1. Last month's weekly wraps (`briefs/weekly/YYYY-WW.md` for the month just closed).
2. `commitments/open.md` + `commitments/closed.md` — what shipped, what slipped.
3. `ventures/union.md` — progress vs. strategic frame (turnaround / growth reacceleration).
4. `ventures/union.md` → bliss shipping pipeline + cost-cutting workstream — item-level status.
5. `people/*.md` — any relationship thread that moved or stalled.
6. Calendar month-in-review — where Sean's time actually went.

## Output — write to `briefs/monthly/YYYY-MM.md`

Template:

```
# Monthly review — YYYY-MM

## What moved
- <venture-level outcome> — <why it moved — the unlock>

## What's stuck
- <initiative> — <why stuck> — <what it would take>

## Where time actually went vs. stated priorities
- Union product (bliss shipping): <est %>
- Union ops (cost-cutting + CX): <est %>
- Maya build: <est %>
- Personal / off-venture: <est %>
- Observation: <gap vs. what Sean said mattered at the start of the month>

## Turnaround scoreboard (Union)
- ARR: <start> → <end>
- Growth rate: <trend>
- Studio plan conversions: <count>
- Anything signaling the stall is breaking: <evidence or "none">

## People signals
- <name> — <what the relationship did this month — status change, friction, expansion>

## Decisions the month surfaced (Sean owns)
- <decision> — <framing> — <options> — <recommended frame, not recommendation>

## One strategic question
<one thing worth sitting with for the next week — not answerable in this brief>
```

## Rules
- **"Where time actually went" is the load-bearing section.** Sean over-commits; his INTP Perceiving + long-range planning makes him susceptible to taking on parallel workstreams. Make the month's real resource allocation visible and unmissable.
- Compare to stated priorities from the month's first daily brief — cite the drift explicitly.
- If a bliss ship date (Stripe sub-accounts, MA v1, etc.) slipped, call it out by name with the original date + actual ship date.
- One strategic question only. Not a list. It should open a fork, not close a loop.
- Keep total length under two screens. Readable in 4 minutes or it's too long.

## Tone
Meta-view. Directional. No narration. Cite specific weekly wraps, briefs, commitment rows.
