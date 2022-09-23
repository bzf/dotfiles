autoload -U compinit
compinit

HISTFILE=~/.zsh_history
HISTSIZE=20000
SAVEHIST=20000

bindkey -e

alias ..='cd ..'
alias vim='nvim'
alias be="bundle exec"

compdef g=git

function g() {
  if [ "$#" -eq 0 ]; then
    git status
  else
    git "$@"
  fi
}

function open() {
  if (hash open 2>/dev/null); then
    command open "$@"
  elif (hash xdg-open 2>/dev/null); then
    xdg-open "$@"
  else
    echo "No open command found."
    return 1
  fi
}

export PATH="$PATH:$HOME/.volta/bin"
export PATH="$PATH:$HOME/.rbenv/bin"

eval "$(starship init zsh)"
eval "$(rbenv init - zsh)"
source "$HOME/.cargo/env"
source /etc/profile.d/autojump.sh
source /usr/share/autojump/autojump.zsh
