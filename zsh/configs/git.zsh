compdef g=git

function g {
  if [[ $# -gt 0 ]]; then
    git "$@"
  else
    git status
  fi
}
