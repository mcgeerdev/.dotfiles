# .dotfiles
This is a central place to store my nvim developer experience setup.
This repo is to manage my vim experience in a single repo so that I can clone the repo to any machine then stow the contents to have my setup of nvim on any linux distro.

## Prerequisites
- Lua
- Neovim
- Stylua
- Nerdfonts
- Stow (for install script)
- Ripgrep (Telescope `live_grep` depends on it)
- Gitleaks (the pre-commit secret scan refuses to run without it)

## Secret scanning

This repo is public, so a committed credential is published the moment it is
pushed and rewriting history does not take it back. `githooks/pre-commit` runs
`gitleaks` over the staged diff and refuses the commit on a finding. It also
refuses when `gitleaks` is missing, rather than passing everything through
unscanned.

`install.sh` points Git at the directory. On a clone that skipped it:

```sh
git config core.hooksPath githooks
```

A false positive goes in `.gitleaksignore` as the fingerprint the finding
prints. `git commit --no-verify` skips the hook for one commit.


## TODOS
[] Add auto imports for golang - The packages should automatically be imported after being called in the methods.

[] Add git actions - Push, Pull, Stash, Rebase

[] 


## Mac Productivity Apps

- RayCast - Upgraded mac search: `CMD` + `SPACE`
- Rectangle - Window management with the keyboard
- Ghostty - GPU-accelerated native terminal; config managed in this repo
