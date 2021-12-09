alias vim='nvim'

export PS1='%~ $ '

function g() {
	if [ "$#" -eq 0 ]; then
		git status
	else
		git "$@"
	fi
}

if [ -d "$HOME/.rbenv/" ]; then
  export PATH="$PATH:$HOME/.rbenv/bin"
  eval "$(rbenv init - zsh)"
elif read -q "REPLY?rbenv is missing. Install now? [y/N] "; then
  echo ''
  git clone https://github.com/rbenv/rbenv.git ~/.rbenv
  export PATH="$PATH:$HOME/.rbenv/bin"
  eval "$(rbenv init - zsh)"

  mkdir -p "$(rbenv root)"/plugins
  git clone https://github.com/rbenv/ruby-build.git "$(rbenv root)"/plugins/ruby-build
fi
