export EDITOR=nvim

export PATH="$PATH:$HOME/.bin"
export PATH="$PATH:$HOME/.local/bin"
[ -f "$HOME/.cargo.env" ] && . "$HOME/.cargo/env"

if command -v nproc &>/dev/null; then
  export CPU_COUNT=$(nproc)
elif sysctl -n hw.ncpu &>/dev/null; then
  export CPU_COUNT=$(sysctl -n hw.ncpu)
fi

export MAKEFLAGS="-j`expr $CPU_COUNT - 1`"

[ -f ~/.zshenv.local ] && source ~/.zshenv.local
