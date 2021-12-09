autoload -U compinit
compinit

HISTFILE=~/.zsh_history
HISTSIZE=20000
SAVEHIST=20000

bindkey -e

alias ..='cd ..'
alias vim='nvim'
alias r="$(rbenv which rails)"

function rails() {
  echo "----> Use 'r' instead!"
  "$(rbenv which rails)" "$@"
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

if [ -d "$HOME/.cargo/" ]; then
  source $HOME/.cargo/env
elif read -q "REPLY?cargo is missing. Install now? [y/N] "; then
  echo ''
  curl https://sh.rustup.rs -sSf | sh -s -- -y --no-modify-path
  source $HOME/.cargo/env
fi

if [ "$(command -v starship)" ]; then
  eval "$(starship init zsh)"
elif read -q "REPLY?starship is missing. Install now? [y/N] "; then
  echo ''
  sh -c "$(curl -fsSL https://starship.rs/install.sh)" -- -y
  eval "$(starship init zsh)"
fi

if [ -f "/usr/share/autojump/autojump.sh" ]; then
  source /usr/share/autojump/autojump.sh
elif   [ -f /usr/local/etc/profile.d/autojump.sh ]; then
  source /usr/local/etc/profile.d/autojump.sh
fi

