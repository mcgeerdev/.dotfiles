# User rules

Hard requirements translated from Claude Code settings.

## Team defaults

- Never deploy without explicit approval.
- Never modify remote infrastructure directly — central envs (dev, test, uat, stage, prod) are managed via scripts and CI.

## Commits & PRs

Never add AI attribution or `Co-Authored-By` trailers to commits or PRs.

## Comments

If you need a paragraph long comment to justify why a workaround is OK, the code is wrong, fix the code.

## Shell

`bashInterceptor` rejects these forms, but only after the call is spent. Reach
for the tool first.

- Write files with `write`, never `echo`/`printf`/`cat` redirection.
- Set the directory in the bash `cwd` field, never `cd DIR && …`.
- Read files with `read`, never `cat`/`head`/`tail`/`less`.
- Search with `grep`/`glob`, never a leading `grep`/`rg`/`find`/`fd`. Inside a
  pipeline that computes a count or set difference, they are fine.
- Edit in place with `edit`, never `sed -i`/`perl -i`.
