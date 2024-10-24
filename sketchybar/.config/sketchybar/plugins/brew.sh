#!/bin/bash

source "$HOME/.config/sketchybar/colors.sh"

COUNT_BREW=$(brew outdated | wc -l | tr -d ' ')
COUNT_CASK=$(brew outdated --cask --greedy | wc -l | tr -d ' ')
COUNT_TOTAL=$(($COUNT_BREW+$COUNT_CASK))

COLOR=$RED
LABEL=$COUNT_BREW/$COUNT_CASK

case "$COUNT_TOTAL" in
  [3-5][0-9]) COLOR=$MAROON
  ;;
  [1-2][0-9]) COLOR=$PEACH
  ;;
  [1-9]) COLOR=$YELLOW
  ;;
  0) COLOR=$GREEN
     LABEL=􀆅
  ;;
esac

sketchybar --set $NAME label=$LABEL icon.color=$COLOR
