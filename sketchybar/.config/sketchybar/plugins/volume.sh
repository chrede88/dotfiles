#!/bin/bash

volume_change() {
  source "$HOME/.config/sketchybar/icons.sh"
  VOLUME=$INFO

  LABEL=$VOLUME"%"
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

  sketchybar --set $NAME icon=$ICON label=$LABEL
}

bt_audio() {
  source "$HOME/.config/sketchybar/icons.sh"
  DEVICE="$(SwitchAudioSource -t output -c)"
  echo $DEVICE

  if [[ $DEVICE == .*AirPods.* ]]; then
    sketchybar --set $NAME icon="$AIRPODS"
  else
    echo "Not AirPods"
  fi
}

case "$SENDER" in
  "volume_change") volume_change
  ;;
  "bt_audio") bt_audio
  ;;
esac
