export EDITOR=nvim

export PATH="$PATH:$HOME/.bin"
export PATH="$PATH:$HOME/.local/bin"
. "$HOME/.cargo/env"

export CPU_COUNT=$(nproc --all)
export MAKEFLAGS="-j$(($CPU_COUNT - 1))"
