#!/bin/bash

source "$HOME/.config/sketchybar/icons.sh"
source "$HOME/.config/sketchybar/colors.sh"

if [ "$SENDER" = "volume_change" ]; then
  VOLUME=$INFO

  case $VOLUME in
    [6-9][0-9]|100) ICON=$VOLUME_100
    ;;
    [3-5][0-9]) ICON=$VOLUME_66
    ;;
    [1-2][0-9]) ICON=$VOLUME_33
    ;;
    [1-9]) ICON=$VOLUME_10
    ;;
    *) ICON=$VOLUME_0
  esac

  sketchybar --set $NAME icon="$ICON"
fi