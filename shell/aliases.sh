# File listing — eza
if command -v eza &> /dev/null; then
  alias ls='eza -lh --group-directories-first --icons=auto'
  alias lsa='ls -a'
  alias lt='eza --tree --level=2 --long --icons --git'
  alias lta='lt -a'
fi

# Fuzzy find with bat preview
if command -v fzf &> /dev/null; then
  alias ff="fzf --preview 'bat --style=numbers --color=always {}'"
  alias eff='$EDITOR "$(ff)"'
fi

# Zoxide cd override
if command -v zoxide &> /dev/null; then
  alias cd="zd"
  zd() {
    if (( $# == 0 )); then
      builtin cd ~ || return
    elif [[ -d $1 ]]; then
      builtin cd "$1" || return
    else
      if ! z "$@"; then
        echo "Error: Directory not found"
        return 1
      fi
      pwd
    fi
  }
fi

# Directory traversal
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'

# Editor shortcut
n() { if [ "$#" -eq 0 ]; then command nvim . ; else command nvim "$@"; fi; }

# Tmux attach or new session
alias t='tmux attach || tmux new -s main'

# Git shortcuts
alias g='git'
alias gcm='git commit -m'
alias gcam='git commit -a -m'
alias gcad='git commit -a --amend'

# Docker
alias d='docker'

# Misc
alias ll='ls -lha'
alias compress='tar -czf'
alias decompress='tar -xzf'

# xdg-open wrapper
open() (
  xdg-open "$@" >/dev/null 2>&1 &
)
