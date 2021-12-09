HISTFILE=~/.zsh_history
HISTSIZE=20000
SAVEHIST=20000

bindkey -e

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

if [ -d "$HOME/.volta/" ]; then
  export PATH="$PATH:$HOME/.volta/bin"
elif read -q "REPLY?volta is missing. Install now? [y/N] "; then
  echo ''
  curl https://get.volta.sh | bash -s -- --skip-setup
  export PATH="$PATH:$HOME/.volta/bin"
fi

if [ -d "$HOME/.fzf/" ]; then
  source "$HOME/.fzf/shell/key-bindings.zsh"
elif read -q "REPLY?fzf is missing. Install now? [y/N] "; then
  echo ''
  git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
  ~/.fzf/install --no-update-rc --no-completion --no-key-bindings
  source "$HOME/.fzf/shell/key-bindings.zsh"
fi

if [ -f "/usr/share/autojump/autojump.sh" ]; then
   source /usr/share/autojump/autojump.sh
fi
