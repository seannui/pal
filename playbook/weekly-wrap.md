# Runbook — Friday wrap

Default trigger: Fridays 16:00 CT.

## Inputs
1. The week's briefs (`briefs/daily/YYYY-MM-*` for this week).
2. `commitments/open.md` and changes since last Friday.
3. `ventures/*.md` — progress vs. current 30-day goal.
4. Calendar review — what got time, what didn't.

## Output — write to `briefs/weekly/YYYY-WW.md`

Template:

```
# Weekly wrap — week of YYYY-MM-DD

## Closed this week
- ...

## Slipped
- <item> — <why, if known> — <next move>

## Time audit
- Venture A: <est hours / % of meeting time>
- Venture B: <est hours>
- Other: <est>
- Gap vs. stated priorities: <observation>

## Needs a decision before Monday
- <decision> — <options> — <recommendation framing>

## One question for the weekend
<something worth him thinking on — a strategic fork, a relational nudge, a pattern he should see>

## Next week's pre-read
- <what's booked, what's at stake, what to prep>
```

## Rules
- **Time audit is the most valuable section.** Sean over-commits and loses track of where his time went. Make the gap between stated priorities and actual time-spent visible and unmissable.
- "One question" should be exactly one. Not three. It should provoke thinking, not require an answer.
- Don't list everything that happened — that's what daily briefs are for. Weekly is the meta-view.
- If a commitment has slipped two weeks in a row, escalate it explicitly: "*This is the second week this has slipped.*"
