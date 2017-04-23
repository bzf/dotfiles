# Enable completion
autoload -U compinit
compinit

# Save a ton of history
HISTFILE=~/.zsh_history
HISTSIZE=20000
SAVEHIST=20000

# Add some PATH variables
export PATH=/usr/local/bin:$PATH
export PATH=$HOME/.cabal/bin:$PATH

# Source all the stuff from ~/.zsh
for file in `find ~/.zsh`; do
  source $file
done

export PATH=$HOME/.bin:$PATH

export LANG=en_GB.UTF-8
export LC_ALL=en_GB.UTF-8
export EDITOR=nvim

# Enable vi-mode
bindkey -v
export KEYTIMEOUT=1

# Disable the 'replay' command
# http://zsh.sourceforge.net/Doc/Release/Shell-Builtin-Commands.html#index-r
disable r
