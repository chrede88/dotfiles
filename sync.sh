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
  stow -vRn btop
  stow -vRn fastfetch
  stow -vRn gh
  stow -vRn ghostty
  stow -vRn git
  stow -vRn gitconfig
  stow -vRn kubecolor
  stow -vRn micro
  stow -vRn starship
  stow -vRn yazi
  stow -vRn zed
  stow -vRn zsh
  stow -vRn zsh-highlight
else
  stow -vR bat
  stow -vR btop
  stow -vR fastfetch
  stow -vR gh
  stow -vR ghostty
  stow -vR git
  stow -vR gitconfig
  stow -vR kubecolor
  stow -vR micro
  stow -vR starship
  stow -vR yazi
  stow -vR zed
  stow -vR zsh
  stow -vR zsh-highlight
fi
