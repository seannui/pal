# Runbook — morning brief

Default trigger: weekday 7:00 CT (once `schedule` is wired).

## Inputs
1. Today's calendar (Google Calendar MCP). Include tomorrow if today is light.
2. `commitments/open.md` — anything due today, this week, or overdue.
3. `ventures/*.md` — current 30-day goals, any pending decisions.
4. Unread inbox triage (Gmail MCP) — top 5 threads by priority (see `playbook/triage.md`).
5. `inbox/gaps.md` — any blocking questions for Sean.

## Output — write to `briefs/daily/YYYY-MM-DD.md`

Template:

```
# Brief — <weekday>, YYYY-MM-DD

## Top 3 for today
1. ...
2. ...
3. ...

## Calendar
- HH:MM–HH:MM  <event>  — <one-line context / who / agenda>
- ...

## Open loops needing a move today
- <commitment> — <due date> — <suggested move>

## Watch-out
<one flag — an over-commitment, a blind spot, a stress signal, a relational cost>

## Decisions pending
- <decision> — <framing> — <what's blocking>

## Questions for you
- (from inbox/gaps.md, max 3)
```

## Rules
- Top 3 is a hard cap. If you have more, you haven't prioritized.
- Every calendar item gets one-line context. "Meeting with Jane" is not enough — why, agenda, state.
- Watch-out is mandatory. If nothing flags, say so explicitly: "*No stress/over-commitment signals today.*"
- Keep total length under one screen. This is a scan, not a read.
- If today's load exceeds capacity (Sean booked >6h of meetings, or >3 high-stakes items), flag it and suggest one thing to defer.

## Tone
Direct. Bulleted. No narration. Cite sources (calendar event titles, email subjects, file paths) so Sean can drill in.
