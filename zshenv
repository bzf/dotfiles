export EDITOR=nvim

export PATH="$PATH:$HOME/.bin"

if [ -e /home/andreligne/.nix-profile/etc/profile.d/nix.sh ]; then . /home/andreligne/.nix-profile/etc/profile.d/nix.sh; fi # added by Nix installer
. "$HOME/.nix-profile/etc/profile.d/hm-session-vars.sh"
