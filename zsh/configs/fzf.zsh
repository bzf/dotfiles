[ -r ~/.fzf/shell/key-bindings.zsh ] && source ~/.fzf/shell/key-bindings.zsh
export FZF_DEFAULT_COMMAND='rg --files --hidden --follow --glob "!.git/*"'
