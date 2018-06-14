for function in ~/.zsh/functions/*; do
  source $function
done

autoload -U colors && colors

setopt promptsubst

HISTFILE=~/.zsh_history
HISTSIZE=20000
SAVEHIST=20000

export KEYTIMEOUT=1
export EDITOR=nvim
export LANG=en_GB.UTF-8
export LC_ALL=en_GB.UTF-8
export PATH=/usr/local/bi:$HOME/.bin:$PATH
export PATH=$HOME/.config/yarn/global/node_modules/.bin:$PATH
export PATH=/usr/local/bin:$PATH

alias l="ls -lh $LS_COLOR"
alias la="ls -lAh $LS_COLOR"
alias powr='powder restart'
alias vim='nvim'
alias ..='cd ..'

[ -r /usr/local/share/autojump/autojump.zsh ] && source /usr/local/share/autojump/autojump.zsh
[ -r ~/.fzf/shell/key-bindings.zsh ] && source ~/.fzf/shell/key-bindings.zsh
[ -r ~/.asdf/asdf.sh ] && source ~/.asdf/asdf.sh

bindkey -v

bindkey -M viins '^N' down-line-or-history
bindkey -M viins '^P' up-line-or-history
bindkey -M viins '^A' beginning-of-line
bindkey -M viins '^E' end-of-line

PROMPT='[%{$fg[blue]%}%~%{$reset_color%}%{$fg[green]%}$(git_branch)%{$reset_color%}]
$ '

ensure_tmux_is_running
