export EDITOR=nvim

export PATH="$PATH:$HOME/.bin"
export PATH="$PATH:$HOME/.local/bin"
. "$HOME/.cargo/env"

export CPU_COUNT=$(nproc --all)

if command -v nproc &>/dev/null; then   # GNU/Linux
  export CPU_COUNT=$(nproc)
elif type sysctl -n hw.ncpu &>/dev/null; then   # macOS, FreeBSD
  export CPU_COUNT=$(sysctl -n hw.ncpu)
fi

export MAKEFLAGS="-j$(($CPU_COUNT - 1))"
