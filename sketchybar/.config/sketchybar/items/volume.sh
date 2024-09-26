#!/bin/bash

BT_EVENT="com.apple.bluetooth.status"

volume=(
  script="$PLUGIN_DIR/volume.sh"
  padding_left=5
  padding_right=7
  icon=$VOLUME_100
  icon.color=$FLAMINGO
  icon.font="$FONT:Regular:14.0"
  label.drawing=off
)

status_bracket=(
  background.color=$BACKGROUND_1
  background.border_color=$BACKGROUND_2
  background.border_width=2
)

# sketchybar --add event bt_audio $BT_EVENT \
#            --add item volume right \
#            --set volume "${volume[@]}" \
#            --subscribe volume volume_change bt_audio

sketchybar --add item volume right \
           --set volume "${volume[@]}" \
           --subscribe volume volume_change

sketchybar --add bracket status brew github.bell volume \
           --set status "${status_bracket[@]}"
