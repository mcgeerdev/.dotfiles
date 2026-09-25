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

`bashInterceptor` rejects these forms, but only after the call is spent. It
checks the whole command and then every fragment split on `;`, `&&`, `||`,
`|`, `&` and newlines, so a blocked word anywhere in the command fails it.
Reach for the tool first.

- Write files with `write`, never `echo`/`printf`/`cat` redirection.
- Set the directory in the bash `cwd` field, never `cd DIR && …`.
- Read files with `read`, never `cat`/`head`/`tail`/`less`, not even as
  `| cat` or `| head` at the end of a pipeline.
- Search with `grep`/`glob`, never `grep`/`rg`/`find -name`/`fd`, not even
  after `;`, `&&` or `|`. Filter output in `eval` when a pipeline needs it.
- Edit in place with `edit`, never `sed -i`/`perl -i`.
