# AGENTS.md — pal

## Identity & Purpose

**pal** is Sean Porter's personal and professional chief-of-staff system. It has two layers that coexist in this repo:

1. **COS layer** — markdown files under `cos/` are the system of record (ventures, people, commitments, playbook runbooks, briefs, inbox). Claude Code edits them directly during sessions. `CLAUDE.md` is the governing doc.
2. **Rails layer** — a thin Rails 8 app at the repo root that runs persistent scheduled rhythms (daily brief, Friday wrap, monthly review) via Solid Queue. It **reads and writes** `cos/` markdown — it does not store pal state in a database.

If the Rails layer is deleted and rebuilt, no pal state is lost. `cos/` + git is the audit trail.

See `CLAUDE.md` for the chief-of-staff behavior contract. This file is the engineering contract for the Rails layer.

---

## Tech Stack

- **Runtime:** Ruby 3.3.10 via mise (`.mise.toml`) — matches bliss + Maya.
- **Framework:** Rails 8.1.
- **Databases:** SQLite3 in `storage/` — multi-db split:
  - `development.sqlite3` — primary (unused in v0.1; no pal models).
  - `development_queue.sqlite3` — Solid Queue.
  - `development_cache.sqlite3` — Solid Cache.
  - `development_cable.sqlite3` — Solid Cable.
- **Background jobs:** Solid Queue (`config/recurring.yml`) — `America/Denver` timezone (set via `config.time_zone`).
- **HTTP client:** Faraday (for Claude API calls in `PlaybookRunner`).
- **Env loading:** `dotenv-rails` loads `.env` in development + test.
- **Job monitoring:** Mission Control at `/jobs` (dev).
- **Deployment (not in v0.1):** local `launchd` agent running `bin/rails solid_queue:start`. Kamal + remote server is a later iteration.

---

## Architecture principle (load-bearing)

Rails **reads and writes the markdown files under `cos/`**. Solid Queue / Cache / Cable live in SQLite3 for job plumbing only. **Do not add ActiveRecord models for pal entities** (Commitment, Person, Venture, Brief). Parse the markdown. If you're tempted, stop and re-read this section.

---

## Job structure

```
app/jobs/
├── application_job.rb           ← Rails default; retry / discard policy
├── daily_brief_job.rb           ← perform → PlaybookRunner(daily)
├── weekly_wrap_job.rb           ← perform → PlaybookRunner(weekly)
└── monthly_review_job.rb        ← perform → PlaybookRunner(monthly); self-gates on first Monday

app/services/
└── playbook_runner.rb           ← shared; reads playbook + context files, calls Claude API (v0.1.1+), writes brief to cos/briefs/<scope>/<date>.md
```

Every job body should be a one-line delegate to `PlaybookRunner.new(...).run`. Job-specific logic (e.g., first-Monday gate) lives in the job; runbook execution lives in the runner.

---

## Secrets & `.env`

- `.env` is gitignored. Encrypted file is `.env.encrypted` (committed).
- Encrypt: `bin/env-encrypt` → `keybase encrypt -i .env -o .env.encrypted seannui`
- Decrypt: `bin/env-decrypt` → `keybase decrypt -i .env.encrypted -o .env`
- **Pal deviation from bliss/Maya pattern:** encrypted for Sean's Keybase key (`seannui`) only, not the `supersetlabs` team. Pal is Sean-personal, not a team repo.
- Required env vars listed in `.env.example`.

---

## Development conventions

### Style
- **RuboCop omakase** — run `bin/rubocop` before committing.
- **Brakeman** — `bin/brakeman` for security checks.
- **bundler-audit** — run in CI.

### Architecture
- Skinny controllers (none yet in v0.1).
- Service objects for any logic beyond one-liners (see `PlaybookRunner`).
- Every recurring job must be idempotent — re-running for the same date should overwrite, not duplicate.

### Testing
- Minitest (Rails default).
- For PlaybookRunner, stub the Claude API via WebMock.
- Run `bin/rails test` after every change.

### Git
- Commit messages: imperative, concise summary.
- Co-author: `Co-Authored-By: Claude Opus 4.7 (1M context) <noreply@anthropic.com>`.
- Branch naming: `feature/`, `fix/`, `chore/` (bliss convention).

---

## Recurring schedule (v0.1)

All in `America/Denver`; cron entries in `config/recurring.yml`.

| Rhythm | Cron | Job |
|---|---|---|
| Daily brief (weekdays) | `57 6 * * 1-5` | `DailyBriefJob` |
| Friday wrap | `3 16 * * 5` | `WeeklyWrapJob` |
| Monthly review (first Mon) | `3 7 * * 1` (self-gated) | `MonthlyReviewJob` |
| Solid Queue housekeeping | `every hour at minute 12` | `SolidQueue::Job.clear_finished_in_batches` |

Minutes are deliberately off `:00` / `:30` to avoid the global-fleet default-cron window.

---

## Running locally

```bash
bin/setup                # install gems, load schemas
bin/env-decrypt          # decrypt .env.encrypted to .env
bin/dev                  # foreman: web (port 3000) + jobs
```

`bin/dev` uses `Procfile.dev` to run Puma + solid_queue together. For persistent scheduling (i.e., jobs firing when the terminal is closed), see the launchd setup in `README.md`.

---

## Iteration roadmap

- **v0.1** (current) — Rails shell + Solid Queue multi-db + stub `PlaybookRunner`. Scheduler proven end-to-end.
- **v0.1.1** — Real Claude API call in `PlaybookRunner` with prompt caching over the playbook + CLAUDE.md.
- **v0.2** — Google Calendar + Gmail pulled into the daily brief.
- **v0.3** — Pull Union API endpoints (realtime biz metrics).
- **v0.4** — Hotwire UI (read-only) for commitments, briefs, people.
- **v0.5** — Kamal deploy so pal runs without Sean's laptop on.
