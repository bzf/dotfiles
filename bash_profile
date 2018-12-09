# vim:ft=sh

_current_branch() {
  if git rev-parse --is-inside-work-tree >/dev/null >/dev/null 2>/dev/null; then
    branch=$(git symbolic-ref HEAD 2>/dev/null | cut -d'/' -f3- 2>/dev/null)
    echo " $(tput sitm)[$branch]$(tput sgr0)"
  fi
}

g() {
  if [ $# -gt 0 ]; then
    git "$@"
  else
    git status
  fi
}

FZF_DEFAULT_COMMAND='rg --files --hidden --follow --glob !.git/*'
EDITOR=vim
PATH=$HOME/.cargo/bin:$HOME/.bin:$HOME/.fzf/bin:$HOME/bin:$PATH
PS1="$(tput bold)\\h:\\w$(tput sgr0)\$(_current_branch) \$$(tput sgr0) "
export PATH HOME PS1 EDITOR FZF_DEFAULT_COMMAND

alias la="ls -la"
alias l="ls -l"
alias be="bundle exec"
alias ..="cd .."

[ -e ~/.asdf/asdf.sh ] && . "$HOME/.asdf/asdf.sh"
[ -e ~/.asdf/completions/asdf.bash ] && . "$HOME/.asdf/completions/asdf.bash"

[ -r "$HOME/.fzf/shell/key-bindings.bash" ] \
  && . "$HOME/.fzf/shell/key-bindings.bash"

PLATFORM_RC="$HOME/.profile.$(uname | awk '{print tolower($0)}')"
[ -r $PLATFORM_RC ] && . "$PLATFORM_RC"
