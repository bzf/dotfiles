export EDITOR=nvim

export PATH="$PATH:$HOME/.bin"
export PATH="$PATH:$HOME/.local/bin"
. "$HOME/.cargo/env"

if command -v nproc &>/dev/null; then
  export CPU_COUNT=$(nproc)
elif sysctl -n hw.ncpu &>/dev/null; then
  export CPU_COUNT=$(sysctl -n hw.ncpu)
fi

export MAKEFLAGS="-j`expr $CPU_COUNT - 1`"

export PATH="/opt/homebrew/opt/dotnet@6/bin:$PATH"
export PATH="/opt/homebrew/Cellar/postgresql@15/15.3_2/bin:$PATH"

