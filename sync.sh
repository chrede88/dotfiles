#!/bin/zsh

# Call sync.sh with flag -n to run a dry-run.

while getopts "n" flag; do
  case "$flag" in
    n)
      DRYRUN=true
      ;;
  esac
done

if [ "$DRYRUN" = true ]; then
  stow -vRn bat
  stow -vRn gh
  stow -vRn git
  stow -vRn gitconfig
  stow -vRn kitty
  stow -vRn macchina
  stow -vRn micro
  stow -vRn sketchybar
  stow -vRn skhd
  stow -vRn starship
  stow -vRn yabai
  stow -vRn yazi
  stow -vRn zsh
  stow -vRn zsh-highlight
else
  stow -vR bat
  stow -vR gh
  stow -vR git
  stow -vR gitconfig
  stow -vR kitty
  stow -vR macchina
  stow -vR micro
  stow -vR sketchybar
  stow -vR skhd
  stow -vR starship
  stow -vR yabai
  stow -vR yazi
  stow -vR zsh
  stow -vR zsh-highlight
fi
