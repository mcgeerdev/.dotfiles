#!/usr/bin/env bash
# Link everything in wow/ into $HOME, add the agent links stow cannot own, and
# point Git at the tracked hooks. Run it whenever you suspect drift. On a
# machine that is already in sync it changes nothing.
#
# A real file or directory where a link belongs is moved to
# ~/.dotfiles-backup/<timestamp>.<random>/ before linking, so nothing is lost.
set -euo pipefail

repo="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
backup="" # created on first use, unique per run

# These sit inside ~/.claude (its own git repo) and ~/.agents (shared with other
# tools), so stow would fight over them. link|store, both relative to $HOME.
AGENT_LINKS="
.agents/skills|.omp/agent/skills
.claude/skills|.omp/agent/skills
.claude/commands|.omp/agent/commands
"

backup_path() { # path relative to $HOME
  if [ -z "$backup" ]; then
    mkdir -p "$HOME/.dotfiles-backup"
    backup="$(mktemp -d "$HOME/.dotfiles-backup/$(date +%Y%m%d-%H%M%S).XXXX")"
  fi
  mkdir -p "$(dirname "$backup/$1")"
  mv "$HOME/$1" "$backup/$1"
  echo "moved ~/$1 to $backup/$1"
}

# Stow aborts outright when a real directory sits where wow/ has a file, so
# move those first. Only walk where $HOME has a real directory: everywhere else
# stow links the whole directory and never looks inside.
move_dirs_over_files() { # path relative to wow/, empty for the top
  local entry rel
  for entry in "$repo/wow/${1:+$1/}"* "$repo/wow/${1:+$1/}".[!.]*; do
    [ -e "$entry" ] || [ -L "$entry" ] || continue
    rel="${1:+$1/}$(basename "$entry")"
    [ -d "$HOME/$rel" ] && [ ! -L "$HOME/$rel" ] || continue
    if [ -d "$entry" ] && [ ! -L "$entry" ]; then
      move_dirs_over_files "$rel"
    else
      backup_path "$rel"
    fi
  done
}

# 1. Stow wow/. A dry run lists what else blocks it; move those aside, then stow.
move_dirs_over_files ""
conflicts="$(
  { stow -n -d "$repo" -t "$HOME" -R wow 2>&1 || true; } | sed -nE \
    -e 's/^  \* cannot stow .* over existing target (.+) since .*/\1/p' \
    -e 's/^  \* existing target is not owned by stow: (.+)$/\1/p' \
    -e 's/^  \* existing target is stowed to a different package: (.+) => .*/\1/p'
)"
while IFS= read -r path; do
  [ -n "$path" ] && backup_path "$path"
done <<< "$conflicts"
stow -d "$repo" -t "$HOME" -R wow

# 2. Agent links into the skill and command store.
while IFS='|' read -r rel store; do
  [ -n "$rel" ] || continue
  # One ../ per directory between $HOME and the link.
  target="$(dirname "$rel" | sed -E 's#[^/]+#..#g')/$store"
  [ -d "$HOME/$store" ] || { echo "error: ~/$store is missing after stow" >&2; exit 1; }
  if [ -L "$HOME/$rel" ] && [ "$(readlink "$HOME/$rel")" = "$target" ]; then
    continue
  fi
  if [ -L "$HOME/$rel" ]; then
    rm "$HOME/$rel"
  elif [ -e "$HOME/$rel" ]; then
    backup_path "$rel"
  fi
  mkdir -p "$(dirname "$HOME/$rel")"
  ln -s "$target" "$HOME/$rel"
  echo "linked ~/$rel -> $target"
done <<< "$AGENT_LINKS"

# 3. core.hooksPath is local config, so a fresh clone has no secret scan until
# this runs.
git -C "$repo" config core.hooksPath githooks

echo "install: wow stowed, agent links in place"
