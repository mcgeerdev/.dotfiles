# Weekly way-of-work improvements

You are working in `/Users/devanmcgeer/.dotfiles-release`, a git worktree
checked out on the current `release/<version>` branch. Turn this week's
digest into at most 3 small, independent improvements, committed here.
You commit and push; the user merges the release PR. Never merge, close,
or approve the PR, and never push to main.

## Input

This week's `wow/.omp/audits/weekly/*.json` (the newest), earlier weeklies
and `wow/.omp/audits/patterns/*.json` for trend context, and the current
repository state. Every improvement must cite a digest/patterns datum as
its motivation; no datum, no change.

## What an improvement may touch

Files under `wow/` only: skills, RULES.md, omp config, dynacat config,
attentiond config, `.wow/bin` scripts, launchd plists. Nothing outside
this repository, no remote infrastructure, no secrets.

Never change a file that has uncommitted changes in the live checkout:
list them with `git -C ~/.dotfiles status --porcelain`. Those edits are
the user's work in progress, and a release that touches the same file
makes `wow-sync`'s fast-forward refuse to apply. Put the idea in
Suggestions instead.

## Rules per improvement

- One focused change, one commit, directly on the current branch.
- Conventional commit subject (`feat(wow): …` or `fix(wow): …`),
  imperative, 50 chars or less; body explains what and why, wrapped at
  72, citing the datum. No AI attribution, no Co-Authored-By trailers.
- Never delete a file: `git mv` it to
  `archive/wow/YYYY-MM/<repo-relative-path>` (create directories) and
  update whatever referenced it.
- A change you are not confident making autonomously (secrets, IAM,
  anything ambiguous) becomes a suggestion instead: no commit, one
  bullet in the PR body's Suggestions section.

## After committing

Push the branch. Then rewrite the release PR body
(`gh pr edit <number> --body-file …`) with these sections, applying
skill://technical-writing and the unslop skill:

1. `## Changes` — one bullet per commit on this branch not on main
   (`git log origin/main..HEAD --oneline` is the source), grouped by week.
2. `## Suggestions` — open suggestions, each with its datum. Keep earlier
   suggestions unless a change resolved them.
3. `## Data` — one line per audit file updated this cycle.

## Guards

- If there is no weekly digest JSON dated within the last 7 days, stop.
- If the working tree is dirty before you start, stop and report it.
