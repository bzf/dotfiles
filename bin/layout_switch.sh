#!/bin/bash
# LICENSE: PUBLIC DOMAIN
# switch between my layouts

# If an explicit layout is provided as an argument, use it. Otherwise, select
# the next layout from the set [us, se].
if [[ -n "$1" ]]; then
  setxkbmap $1 -variant mac
else
  layout=$(setxkbmap -query | grep layout | awk 'END{print $2}')
  case $layout in
    us)
      setxkbmap se -variant mac
      ;;
    se)
      setxkbmap us -variant mac
      ;;
  esac
fi
