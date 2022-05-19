autoload -U compinit
compinit

HISTFILE=~/.zsh_history
HISTSIZE=20000
SAVEHIST=20000

bindkey -e

alias ..='cd ..'
alias vim='nvim'
alias r="bundle exec rails"

function rails() {
  echo "----> Use 'r' instead!"
  "bundle exec rails" "$@"
}

export PS1='%~ $ '

compdef g=git

function g() {
	if [ "$#" -eq 0 ]; then
		git status
	else
		git "$@"
	fi
}

if [ -d "$HOME/.volta/" ]; then
  export PATH="$PATH:$HOME/.volta/bin"
elif read -q "REPLY?volta is missing. Install now? [y/N] "; then
  echo ''
  curl https://get.volta.sh | bash -s -- --skip-setup
  export PATH="$PATH:$HOME/.volta/bin"
fi

eval "$(starship init zsh)"
source "$HOME/.nix-profile/share/autojump/autojump.zsh"

function archivebox() {
  echo "Running archivebox in ~/.archivebox"

  pushd ~/.archivebox

	if [ "$1" = "open" ]; then
		~/.bin/archivebox-open "$@"
	else
    command archivebox "$@"
  fi

  popd
}
