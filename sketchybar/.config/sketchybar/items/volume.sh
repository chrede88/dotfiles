#!/bin/bash

volume=(
  script="$PLUGIN_DIR/volume.sh"
  padding_left=5
  padding_right=7
  icon=$VOLUME_100
  icon.color=$GREY
  icon.font="$FONT:Regular:14.0"
  label.drawing=off
)

status_bracket=(
  background.color=$BACKGROUND_1
  background.border_color=$BACKGROUND_2
  background.border_width=2
)

sketchybar --add item volume right \
           --set volume "${volume[@]}" \
           --subscribe volume volume_change

sketchybar --add bracket status brew github.bell volume \
           --set status "${status_bracket[@]}"
