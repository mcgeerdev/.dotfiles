# Weekly way-of-work release

You are working in `/Users/devanmcgeer/.dotfiles-release`, a git worktree
checked out on the current `release/<version>` branch. Change the user's
way of work where the audits show it would help, commit every change
here, and write the release PR body: a changelog of what you changed and
suggestions for third-party tools. You commit and push; the user merges
the release PR. Never merge, close, or approve the PR, and never push to
main.

## Evidence

Every change and every suggestion names the data behind it. Sources:

- `wow/.omp/audits/weekly/*.json` (newest first) and
  `wow/.omp/audits/patterns/*.json`.
- The interactive audits in `wow/.omp/audits/` (`*.html`, `*.md`).
- `~/.omp/stats.db`, `~/.omp/agent/history.db`, and session transcripts
  under `~/.omp/agent/sessions/` for the detail behind a number.
- The current state of the files you change.

No evidence, no change.

## What to change

Make the changes yourself. There is no cap on their number; the bar is
evidence and one reviewable commit each. Scope is this repository except
the `claude` and `pkms` submodules:

- omp: `wow/.omp/agent/` (RULES.md, config.yml, skills, agents),
  `wow/.omp/WATCHDOG.yaml`.
- New skills go straight into `wow/.omp/agent/skills/<name>/SKILL.md`,
  complete and usable, when the transcripts show the same procedure
  repeated by hand.
- Editor and terminal: `wow/.config/nvim`, `wow/.config/ghostty`,
  `wow/.config/wezterm`, `wow/.config/starship.toml`, `wow/.zshrc`.
- Dashboard and attention: `wow/.attn/config.toml`, `wow/.wow/dynacat`,
  `wow/.wow/herdr`.
- Automation: `wow/.wow/bin`, `wow/.wow/launchd`, `wow/.wow/Makefile`,
  `githooks/`, `.github/`.

Out of scope, not changed and not suggested: secrets and tokens, remote
infrastructure, anything outside this repository, and loosening a safety
control (`githooks/`, gitleaks, `rules-guard` deny rules). Narrowing a
`bashInterceptor` pattern that blocks harmless commands is in scope when
you show the harmful form it targets is still blocked.

Never change a file that has uncommitted changes in the live checkout:
list them with `git -C ~/.dotfiles status --porcelain`. Those edits are
the user's work in progress, and a release that touches the same file
makes `wow-sync`'s fast-forward refuse to apply.

## Rules per change

- One focused change, one commit, directly on the current branch.
- Conventional subject, `feat(<area>): …` or `fix(<area>): …`, where
  area is `omp`, `nvim`, `shell`, `terminal`, `attn`, `dynacat` or
  `wow` (automation). Imperative, 50 chars or less. The body explains
  what and why, wrapped at 72, citing the evidence. No AI attribution,
  no Co-Authored-By trailers.
- Validate before committing, with the tool that loads the file: `bash
  -n` or `zsh -n` for scripts, `plutil -lint` for plists, `nvim
  --headless -c qa` for nvim config, a YAML/TOML/JSON parse for config.
  A change that fails validation is not committed.
- Never delete a file: `git mv` it to
  `archive/wow/YYYY-MM/<repo-relative-path>` (create directories) and
  update whatever referenced it.

## Tool suggestions

Suggestions are only for third-party tools and integrations the user
does not use yet: an app, CLI, service, editor plugin, or agent harness
that would remove friction the audits show. Research them on the web;
cite a link and the evidence. Anything you could do by editing this
repository is a change, not a suggestion.

## PR body

Push the branch. Then rewrite the release PR body
(`gh pr edit <number> --body-file …`) with exactly two sections,
applying skill://technical-writing and the unslop skill. The body
becomes the GitHub release notes.

1. `## Changelog`: what changed in the user's way of work since `main`,
   from `git log origin/main..HEAD`, grouped by area. One bullet per
   change: what is different for the user and the evidence behind it,
   with the short SHA. Audit data commits get one closing line
   (`Audits: …`), not a bullet each. Note any change that needs a manual
   step to take effect, such as `make restart` for Dynacat.
2. `## Tool suggestions`: one bullet per tool, with the link and the
   evidence. Keep earlier suggestions unless the user adopted the tool
   or the evidence no longer holds.

## Guards

- If there is no weekly digest JSON dated within the last 7 days, stop.
- If the working tree is dirty before you start, stop and report it.
