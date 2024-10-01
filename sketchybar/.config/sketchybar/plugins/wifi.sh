#!/bin/bash

wifi_change() {
  source "$HOME/.config/sketchybar/icons.sh"
  source "$HOME/.config/sketchybar/colors.sh"

  CURRENT_WIFI="$(ipconfig getsummary en0)"
  LINK_STATUS="$(echo "$CURRENT_WIFI" | grep -o "LinkStatusActive : .*" | sed 's/^LinkStatusActive : //' | tail -n 1)"
  
  if [[ $LINK_STATUS = "TRUE" ]]; then
    ICON=$WIFI
    SSID="$(echo "$CURRENT_WIFI" | grep -o "SSID : .*" | sed 's/^SSID : //' | tail -n 1)"
  else
    ICON=$NO_WIFI
    SSID=""
  fi

  sketchybar --set $NAME icon="$ICON" label="$SSID"
}


case "$SENDER" in
  "wifi_change") wifi_change
  ;;
esac