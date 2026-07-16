---
name: jj-ship
description: Describe jj (Jujutsu VCS) working copy changes and advance the branch bookmark ready for push. Use when user says "describe the changes", "move the bookmark", "ship this", "jj describe", or is wrapping up work in a jj repository. Also handles syncing with main/master before starting new work via `jj git fetch` and `jj new main`.
---

# jj Ship

Describe the working copy and create a feature branch bookmark ready for push.

## Workflow: describe and ship

1. Run `jj log --limit 10` to identify `@` and confirm it is a new change on top of `main` or `master` (not on `main`/`master` itself)
2. Run `jj diff` to understand what changed
3. Draft a commit message (see rules below)
4. Apply: `jj describe -m "..."` via heredoc
5. Create a feature branch bookmark on `@`: `jj bookmark create <name> --revision @`
6. Tell the user to run `jj git push -b <name>` to publish

## Safety checks before proceeding

- **Never move `main` or `master`** — those bookmarks must stay at the upstream merge commit.
- **`@` must be a fresh change on top of `main`/`master`**, not `main`/`master` itself. If `@` carries the `main` or `master` bookmark, stop and tell the user: the working copy is sitting on a protected branch — they need to run `jj new main` first to create a new change before shipping.
- If `@` is already described (has a non-empty description), confirm before overwriting.

## Finding or naming the bookmark

- A feature bookmark for `@` usually does not exist yet — **always create a new one** with `jj bookmark create`.
- Choose a name that reflects the change (e.g. `feat/ci-push-trigger`, `fix/auth-timeout`).
- If the user has not specified a name, infer one from the subject line of the commit message (kebab-case, prefixed with `feat/` or `fix/` as appropriate).
- If multiple candidate names are plausible, suggest one and let the user confirm.

## Workflow: sync and start fresh

When beginning new work after finishing a branch:

```
jj git fetch
jj new main   # or: jj new master
```

## Commit message rules

- Subject: imperative mood, ≤50 chars, capitalised, no trailing period
- Blank line between subject and body
- Body: explain *what* and *why*, wrap at 72 chars, use backticks around identifiers
- Pass multi-line messages via heredoc to avoid shell escaping issues:

```bash
jj describe -m "$(cat <<'EOF'
Subject line here

Body paragraph explaining the change.
EOF
)"
```
