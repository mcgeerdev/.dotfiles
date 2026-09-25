# User rules

Hard requirements translated from Claude Code settings.

## Team defaults

- Never deploy without explicit approval.
- Never modify remote infrastructure directly — central envs (dev, test, uat, stage, prod) are managed via scripts and CI.

## Commits & PRs

Never add AI attribution or `Co-Authored-By` trailers to commits or PRs.

## Comments

If you need a paragraph long comment to justify why a workaround is OK, the code is wrong, fix the code.

## Scratch files

Recursive `rm` is blocked in two places. `rules-guard` denies `rm -rf *` in
bash commands and `eval` code, and `bashInterceptor` denies any recursive `rm`.
Don't spend a call on cleanup. Create scratch trees with `mktemp -d` and leave
them. If a tree inside a repository has to go, such as a stale `.terraform`,
ask the User.

## Browser

`browser.relay: true` sends every `browser.open` to the User's Chrome, and
`tab.screenshot()` there fails unless that tab is in the foreground. For
localhost and other pages that need no login, open with
`app: { relay: false }` to get headless Chromium, where screenshots work.

## Shell

`bashInterceptor` rejects these forms, but only after the call is spent. Reach
for the tool first.

- Write files with `write`, never `echo`/`printf`/`cat` redirection.
- Set the directory in the bash `cwd` field, never `cd DIR && …`.
- Read files with `read`, never `cat`/`head`/`tail`/`less`.
- Search with `grep`/`glob`, never a leading `grep`/`rg`/`find`/`fd`. Inside a
  pipeline that computes a count or set difference, they are fine.
- Edit in place with `edit`, never `sed -i`/`perl -i`.
