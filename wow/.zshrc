# History configuration
HISTSIZE=100000
SAVEHIST=100000
setopt APPEND_HISTORY
setopt INC_APPEND_HISTORY
setopt HIST_IGNORE_DUPS

export PATH="/opt/homebrew/bin:$PATH"
export PATH="${KREW_ROOT:-$HOME/.krew}/bin:$PATH"
export PATH="$HOME/.local/share/mise/shims:$PATH"
eval "$(mise activate zsh)"

alias la="ls -la"
alias ..="cd .."
alias vim="nvim"

alias k="kubectl"

# Load version control information
autoload -Uz vcs_info
precmd() { vcs_info }

# Format the vcs_info_msg_0_ variable
zstyle ':vcs_info:git:*' formats '%b'

# Set up the prompt (with git branch name)
setopt PROMPT_SUBST

PROMPT='[%n@%m %1~]%F{green}(${vcs_info_msg_0_})%F '

source <(fzf --zsh)

# if type brew &>/dev/null; then
#     FPATH=$(brew --prefix)/share/zsh-completions:$FPATH
#
#     autoload -Uz compinit
#     compinit
# fi

work() {
  timer "${1:-25m}" && terminal-notifier -message 'Pomodoro' \
        -title 'Work Timer is up! Take a Break 😊'\
        -sound Crystal
}

rest() {
  # usage: rest 10m, rest 60s etc. Default is 5m
  timer "${1:-5m}" && terminal-notifier -message 'Pomodoro' \
        -title 'Break is over! Get back to work 😬'\
        -sound Crystal
}

# bun completions
[ -s "/Users/devanmcgeer/.bun/_bun" ] && source "/Users/devanmcgeer/.bun/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"

alias claude-mem='/Users/devanmcgeer/.bun/bin/bun "/Users/devanmcgeer/.claude/plugins/marketplaces/thedotmack/plugin/scripts/worker-service.cjs"'
export PATH="/opt/homebrew/opt/libpq/bin:$PATH"

eval "$(starship init zsh)"

autoload -U compinit && compinit
zstyle ':completion:*' format $'\e[2;37mCompleting %d\e[m'
source <(carapace _carapace)
alias tailscale="/Applications/Tailscale.app/Contents/MacOS/Tailscale"

# Shell shtuff
source ~/.zsh/fzf-tab/fzf-tab.plugin.zsh
source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
source ~/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# Tab title: enclosing repo name (git or jj), else the current folder.
# Gated to Ghostty because it is configured to stand down from managing the
# title itself (`shell-integration-features = no-title` in
# ~/.dotfiles/wow/.config/ghostty/config); a terminal that manages its own
# title would overwrite the OSC 2 sequence below on every prompt.
_repo_tab_title() {
  [[ $TERM_PROGRAM == ghostty ]] || return
  local dir=$PWD name=${PWD:t}
  while [[ $dir != / ]]; do
    if [[ -e $dir/.git || -d $dir/.jj ]]; then
      name=${dir:t}
      break
    fi
    dir=${dir:h}
  done
  printf '\e]2;%s\a' "${name:-/}"
}
autoload -Uz add-zsh-hook
add-zsh-hook precmd _repo_tab_title

# Herdr 
export HERDR_CONFIG_PATH="$HOME/.wow/herdr/config.toml"

# attentiond
export PATH="$HOME/.wow/bin:$PATH"

# The Way of Work control surface, from any directory.
#   wow start | stop | restart | status | logs | attn | open
wow() {
  make -C "$HOME/.wow" "${@:-status}"
}

# Report long tofu commands to attentiond so the dashboard knows they are
# running. Everything else passes straight through, and attn-run never changes
# the exit code.
tofu() {
  case "$1" in
    plan|apply|destroy|init|refresh|import|test|validate)
      # `plan -detailed-exitcode` returns 2 for "worked, and there are
      # changes". That is a plan worth looking at, not a broken command.
      if [[ "$1" == plan && "$*" == *-detailed-exitcode* ]]; then
        attn-run --changes-exit 2 -- command tofu "$@"
      else
        attn-run -- command tofu "$@"
      fi
      ;;
    *)
      command tofu "$@"
      ;;
  esac
}
