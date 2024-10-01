#!/bin/bash

wifi=(
  script="$PLUGIN_DIR/wifi.sh"
  padding_left=10
  padding_right=5
  icon.color=$FLAMINGO
  icon.font="$FONT:Regular:14.0"
  label.drawing=on
  label.font="$FONT:Regular:14.0"
  label.max_chars=8
  scroll_texts=on
)

status_bracket=(
  background.color=$BACKGROUND_1
  background.border_color=$BACKGROUND_2
  background.border_width=2
)

sketchybar --add item wifi right \
           --set wifi "${wifi[@]}" \
           --subscribe wifi wifi_change

sketchybar --add bracket status brew github.bell volume wifi \
           --set status "${status_bracket[@]}"
