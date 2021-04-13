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
alias dc='docker-compose'

base16_tomorrow-night

ensure_tmux_is_running
