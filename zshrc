for function in ~/.zsh/configs/*.zsh; do
  . $function
done

for function in ~/.zsh/functions/*.zsh; do
  . $function
done

alias l="ls -lh $LS_COLOR"
alias la="ls -lAh $LS_COLOR"
alias vim='nvim'
alias ..='cd ..'
alias be='bundle exec'

ensure_tmux_is_running
