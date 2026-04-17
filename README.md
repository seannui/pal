# pal

Sean Porter's chief-of-staff system. Markdown state under `cos/`; Rails shell at the root for persistent scheduled rhythms.

See `CLAUDE.md` for the chief-of-staff behavior contract and `AGENTS.md` for the engineering contract.

---

## Setup

```bash
# Ruby via mise (reads .mise.toml)
mise install

# Install gems, prepare DBs, load Solid Queue/Cache/Cable schemas
bin/setup

# Decrypt .env (Keybase-encrypted for seannui only, not a team)
bin/env-decrypt
```

## Running locally

```bash
bin/dev              # foreman: Puma + solid_queue via Procfile.dev
```

- Web: `http://localhost:3000/up`
- Jobs dashboard: `http://localhost:3000/jobs` (Mission Control)

## Persistent scheduling via launchd

For rhythms that fire even when the terminal is closed, install the launchd agent:

```bash
cp config/launchd/com.seanporter.pal.plist ~/Library/LaunchAgents/
launchctl load ~/Library/LaunchAgents/com.seanporter.pal.plist

# Verify
launchctl list | grep pal

# Logs
tail -f log/solid_queue.log log/solid_queue.err
```

Uninstall:
```bash
launchctl unload ~/Library/LaunchAgents/com.seanporter.pal.plist
rm ~/Library/LaunchAgents/com.seanporter.pal.plist
```

## Secrets

- `.env` is gitignored; `.env.encrypted` is committed.
- `bin/env-encrypt` / `bin/env-decrypt` wrap `keybase encrypt|decrypt`.
- Encrypted for `seannui` only — not the `supersetlabs` team. (Deviation from bliss/Maya pattern; pal is Sean-personal.)

## Architecture in one line

`cos/` markdown is the system of record. Rails (and any future UI, API pulls, or jobs) reads and writes `cos/`. Delete Rails, cos/ still has all pal state.
