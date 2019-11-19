for function in ~/.zsh/configs/*.zsh; do
  . $function
done

for function in ~/.zsh/functions/*.zsh; do
  . $function
done

alias l="ls -lh $LS_COLOR"
alias la="ls -lAh $LS_COLOR"
alias powr='powder restart'
alias vim='nvim'
alias ..='cd ..'
alias be='bundle exec'

setopt promptsubst
PROMPT='[%{$fg[blue]%}%~%{$reset_color%}%{$fg[green]%}$(_current_branch)%{$reset_color%}]
$ '

ensure_tmux_is_running
