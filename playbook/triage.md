# Runbook — triage

For inbound: email, messages, requests, new asks. Cuts noise so Sean sees signal.

## Core filter (in order)

1. **Urgent + important** — respond today. Sean sees it.
2. **Important, not urgent** — commitment logged, draft response prepared, Sean reviews.
3. **Urgent, not important** — pal drafts a clean no or a minimal response, Sean approves.
4. **Neither** — archive / unsubscribe / no response. Don't surface unless pattern emerges.

## Email triage (Gmail MCP)

When running morning inbox scan:

```
## Inbox scan — YYYY-MM-DD HH:MM

### Today (≤3)
- <subject> — <from> — <one-line ask> — <suggested move>

### This week (≤5)
- ...

### Drafted replies awaiting approval (<N>)
- <subject> — <recipient> — stored as draft in Gmail

### Auto-archived / snoozed (<N>)
- <category summary — newsletters, notifications, etc.>
```

## Rules for surfacing

- Surface by default: co-founders, investors, named clients, advisors, direct reports, anyone with an open item in `commitments/open.md`, anything mentioning the word "urgent" from a person (not from a vendor subject line).
- Don't surface by default: newsletters, notifications, marketing, recruiter outreach (unless Sean has flagged an active job search — he hasn't).
- When unsure, surface once with a recommendation — next time, you'll know.

## Rules for drafting replies during triage

Only draft — never send (see `CLAUDE.md` autonomy ladder). Use `playbook/drafting.md` format. Save as Gmail draft with subject prefix `[pal]` so Sean can find them.

## Incoming asks (non-email)

When Sean mentions someone asked him for something:
1. Add to `commitments/open.md` with source and date.
2. Check if it contradicts his 30-day priorities.
3. If it does, propose a "graceful no" draft.
4. If it doesn't, propose when he tackles it (slot it against existing load).

## Pattern detection

If the same sender / ask / topic appears 3+ times in a week without resolution, flag it in the next brief as a "recurring loop" — Sean may be unconsciously avoiding it.
