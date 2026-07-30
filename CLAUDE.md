# CLAUDE.md

Onboarding manual for agents entering this repository. Operator persona, tone,
and tutoring rules live in `~/.claude/CLAUDE.md` (machine-root authority).

## WHY
A portable developer-environment vault. Clone to any machine, `stow` the
folders, and the editor/terminal/prompt come up identically. Optimized for
single-machine reproducibility, not multi-user distribution.

## WHAT
- `nvim/` — Neovim config (LazyVim-based). Has its own `CLAUDE.md`.
- `nvim/.zshrc` — Zsh rc, stowed to `~/.zshrc`.
- `nvim/.config/starship.toml` — Starship prompt config.
- `nvim/.config/ghostty/` — Ghostty terminal config (`config` + `themes/matrix`).
- `nvim/.config/wezterm/wezterm.lua` — WezTerm terminal config.
- `pkms/` — Personal knowledge submodule (private, gitignored content).
- `install.sh` — Stow driver. Reads `$STOW_FOLDERS` (comma-separated).
- `watch.sh` / `addKnowledge.cron` — pkms autocommit helpers.

## HOW

### Install / re-stow
```bash
STOW_FOLDERS=nvim ./install.sh
```
Unstows then re-stows each listed folder. Silent on success; surfaces any
stow conflict to stderr.

### Edit a config
1. Edit the file under `<folder>/.config/...` directly — symlinks point here.
2. No rebuild step. Reload the relevant tool (`:Lazy sync`, `cmd+shift+,` in
   Ghostty, restart wezterm).

### Submodules
`pkms` is a separate repo. Never commit pkms content from this repo;
`.gitignore` already blocks it. Use `watch.sh` / `addKnowledge.cron` for
autocommit inside `pkms/`.

## SUBSYSTEM POINTERS
- Neovim internals (LSP, plugins, keymaps): `nvim/.config/nvim/CLAUDE.md`
- Plugin specs: `nvim/.config/nvim/lua/plugins/`

## GUARDRAILS
- Never commit `pkms/`, `.env`, or anything under `obsidian/`.
- Never edit symlinked targets in `$HOME` directly — edit the source here so
  changes are tracked.
- `nvim/.zshrc` is coupled to the Ghostty config: its `_repo_tab_title` precmd
  hook is gated on `TERM_PROGRAM == ghostty` and relies on
  `shell-integration-features = no-title`. Break either and tab titles silently
  stop updating.
- Commit style: see `~/.claude/rules/git-commit.md` (50/72, imperative).
