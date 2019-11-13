# vim:ft=sh

_current_branch() {
  if git rev-parse --is-inside-work-tree >/dev/null >/dev/null 2>/dev/null; then
    branch=$(git symbolic-ref HEAD 2>/dev/null | cut -d'/' -f3- 2>/dev/null)
    echo " [$branch]"
  fi
}

g() {
  if [ $# -gt 0 ]; then
    git "$@"
  else
    git status
  fi
}

LANG=en_US.UTF-8
LC_ALL=en_US.UTF-8
LC_CTYPE=en_US.UTF-8
FZF_DEFAULT_COMMAND='rg --files --hidden --follow --glob !.git/*'
EDITOR=nvim
PATH=$HOME/.cargo/bin:$HOME/.bin:$HOME/.local/bin:$HOME/.fzf/bin:$HOME/bin:$PATH
PS1="\[\033[01;32m\]\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$(_current_branch) \$ "
HISTSIZE=100000

export PS1 PATH HOME EDITOR FZF_DEFAULT_COMMAND LC_ALL LANG LC_CTYPE

alias la="ls -la"
alias l="ls -l"
alias be="bundle exec"
alias ..="cd .."
alias vim='nvim'

[ -r "$HOME/.fzf/shell/key-bindings.bash" ] \
  && . "$HOME/.fzf/shell/key-bindings.bash"

PLATFORM_RC="$HOME/.profile.$(uname | awk '{print tolower($0)}')"
[ -r $PLATFORM_RC ] && . "$PLATFORM_RC"

export VOLTA_HOME="$HOME/.volta"
[ -s "$VOLTA_HOME/load.sh" ] && . "$VOLTA_HOME/load.sh"

export PATH="$VOLTA_HOME/bin:$PATH"
eval "$(rbenv init -)"
