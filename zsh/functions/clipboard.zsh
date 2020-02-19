function clipboard() {
  if [ $(uname) = 'Darwin' ]; then
    pbcopy
  else
    xclip -selection clipboard
  fi
}
