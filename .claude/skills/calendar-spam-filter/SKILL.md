---
name: calendar-spam-filter
description: Use when Sean asks to handle spam Google Calendar invites, calendar invite spam, suspicious webinar/training events, or to add Gmail spam/trash filters from a calendar event using the gws command line app. This skill covers finding the event on sean@union.fit, mail@seanporter.com, or another specified calendar, extracting organizer/sender/reply-to/link domains, and creating Gmail filters that send future matching messages to Trash.
---

# Calendar Spam Filter

## Workflow

Use `gws` for both Calendar and Gmail. Default to `sean@union.fit` unless Sean specifies another account or calendar. If the event is not on the default account, check the personal account before reporting it missing.

1. Resolve relative dates to absolute dates in `America/Denver`.
2. Pull the calendar event with `showHiddenInvitations:true` and `showDeleted:true`; spam invites may be hidden, declined, or cancelled.
3. Extract candidate spam indicators:
   - organizer/creator email domains
   - attendee sender-like emails if present
   - event `location` and description link domains
   - unsubscribe/removal domains
   - unwrap redirect URLs (for example, `google.com/url?q=...`) and evaluate the
     destination domain rather than treating the redirector as the destination
4. Find the related Gmail invite in all mail and inspect metadata headers.
5. Check existing Gmail filters before creating new ones.
6. Create narrow trash filters for missing sender domains and strong link domains.
7. Verify the filters exist.

Do not RSVP, delete, decline, or otherwise modify the calendar event unless Sean explicitly asks in the same turn.

## Accounts

`gws` has two separate login contexts, set up by `~/git/dotfiles`:

| Account | Context | IDs to use |
|---|---|---|
| `sean@union.fit` (default) | plain `gws` | `sean@union.fit` |
| `mail@seanporter.com` (personal) | prefix every command with `GOOGLE_WORKSPACE_CLI_CONFIG_DIR="$HOME/.config/gws-seanporter"` | `"calendarId":"primary"`, `"userId":"me"` |

The examples below use `sean@union.fit`; for the personal account, add the prefix and
swap in `primary` / `me`. Never set the variable globally or run `gws auth login`
without it, since that replaces the Union login that pal's jobs use.

Auth failures:

- `invalid_grant ... invalid_rapt`: Google expired the login. Sean must re-run
  `gws auth login` with the context prefix himself. Write the command to a short-line
  script in the scratchpad and have him run `! sh <path>`; long pasted commands wrap
  and break in his terminal.
- `403 insufficient authentication scopes` on filters: the login needs
  `https://www.googleapis.com/auth/gmail.settings.basic`. Re-login with `--scopes`
  listing the current scopes from `gws auth status` plus that one.
- Still 403 after a scope change: move that context's `token_cache.json` aside
  (`token_cache.pre-<reason>-YYYY-MM-DD.json`) so gws mints a token with the new scopes.
- After any re-login, run `bin/dotf gws_credentials save` in `~/git/dotfiles` and
  tell Sean to commit the updated `secrets/gws*/` files, so other machines get the
  new login.

## Link-Domain Safety

Do not block shared infrastructure or widely used services merely because a spammer
linked to them. Common examples include `zoom.us`, `google.com`, `docs.google.com`,
YouTube, Microsoft, scheduling platforms, and established payment or file-sharing
services. A link-domain filter should target a domain controlled by, branded for, or
strongly associated with the spam campaign. The organizer's sender domain remains a
valid sender-filter candidate even when it is not present as a clickable link.

When an invite contains only mainstream-service links, add no link-domain filter and
say so in the final report.

## Calendar Lookup

Prefer title search first:

```bash
gws calendar events list --params '{
  "calendarId":"sean@union.fit",
  "timeMin":"YYYY-MM-DDT00:00:00-06:00",
  "timeMax":"NEXT-YYYY-MM-DDT00:00:00-06:00",
  "singleEvents":true,
  "orderBy":"startTime",
  "showHiddenInvitations":true,
  "showDeleted":true,
  "maxResults":50,
  "q":"distinctive title text"
}'
```

If that misses, list the whole day without `q`. If the date is uncertain, query a wider window.

Useful event fields:

- `summary`
- `status`
- `start` / `end`
- `organizer.email`
- `creator.email`
- `attendees[].email`
- `location`
- `description`

## Gmail Invite Inspection

Search all mail, including spam and trash:

```bash
gws gmail users messages list --params '{
  "userId":"sean@union.fit",
  "q":"in:anywhere \"distinctive title text\" newer_than:90d",
  "maxResults":20
}'
```

Inspect headers for each matching invite:

```bash
gws gmail users messages get --params '{
  "userId":"sean@union.fit",
  "id":"MESSAGE_ID",
  "format":"metadata",
  "metadataHeaders":["From","Reply-To","Sender","Return-Path","Subject","Date","List-Unsubscribe"]
}'
```

Avoid `gws schema gmail.users.messages.get --resolve-refs`; it may stack overflow.

## Filter Creation

List existing filters first:

```bash
gws gmail users settings filters list --params '{"userId":"sean@union.fit"}'
```

Use existing trash-filter style:

```json
{"criteria":{"from":"@example.com"},"action":{"addLabelIds":["TRASH"]}}
```

Create sender-domain filters for confirmed spam organizer/sender/reply-to domains:

```bash
gws gmail users settings filters create \
  --params '{"userId":"sean@union.fit"}' \
  --json '{"criteria":{"from":"@example.com"},"action":{"addLabelIds":["TRASH"]}}'
```

Create query filters for strong link domains found in the invite body/location:

```bash
gws gmail users settings filters create \
  --params '{"userId":"sean@union.fit"}' \
  --json '{"criteria":{"query":"example-spam-domain.com"},"action":{"addLabelIds":["TRASH"]}}'
```

Do not create filters for Google infrastructure senders such as `calendar-notification@google.com`.

## Event Deletion

Only when Sean explicitly asks to delete the event, remove the exact event ID without
sending an RSVP or cancellation update to the organizer:

```bash
gws calendar events delete --params '{
  "calendarId":"sean@union.fit",
  "eventId":"EVENT_ID",
  "sendUpdates":"none"
}'
```

Verify the event no longer appears in a day query with `showDeleted:false`. Some
versions of `gws` save the empty successful delete response as `download.html` in the
working directory. If this command newly created an empty `download.html`, remove
only that generated artifact; never overwrite or delete a pre-existing file.

## Validation

Verify with:

```bash
gws gmail users settings filters list --params '{"userId":"sean@union.fit"}' | rg -C 5 'example.com|example-spam-domain.com'
```

In the final response, report:

- the calendar event title and date inspected
- the organizer/sender found
- each filter criterion added
- whether the event was deleted or left untouched
- which link domains were preserved as shared/widely used services
