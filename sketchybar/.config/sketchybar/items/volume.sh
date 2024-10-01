#!/bin/bash

volume=(
  script="$PLUGIN_DIR/volume.sh"
  padding_left=0
  padding_right=5
  icon=$VOLUME_100
  icon.color=$FLAMINGO
  icon.font="$FONT:Regular:14.0"
  label.drawing=on
  label.font="$FONT:Regular:14.0"
)

sketchybar --add item volume right \
           --set volume "${volume[@]}" \
           --subscribe volume volume_change
