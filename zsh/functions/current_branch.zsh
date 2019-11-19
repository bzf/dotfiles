_current_branch() {
  if git rev-parse --is-inside-work-tree >/dev/null >/dev/null 2>/dev/null; then
    branch=$(git symbolic-ref HEAD 2>/dev/null | cut -d'/' -f3- 2>/dev/null)
    echo " $branch"
  fi
}
