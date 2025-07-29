#!/bin/bash

wifi_change() {
  source "$HOME/.config/sketchybar/icons.sh"
  source "$HOME/.config/sketchybar/colors.sh"

  CURRENT_WIFI="$(ipconfig getsummary en0)"
  LINK_STATUS="$(echo "$CURRENT_WIFI" | grep -o "LinkStatusActive : .*" | sed 's/^LinkStatusActive : //' | tail -n 1)"

  if [[ $LINK_STATUS = "TRUE" ]]; then
    ICON=$WIFI
  else
    ICON=$NO_WIFI
  fi

  sketchybar --set $NAME icon="$ICON" label=""
}


case "$SENDER" in
  "wifi_change") wifi_change
  ;;
esac