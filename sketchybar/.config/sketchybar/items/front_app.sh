#!/bin/bash

yabai=(
  script="$PLUGIN_DIR/yabai.sh"
  icon.font="$FONT:Bold:16.0"
  label.drawing=off
  icon.width=30
  icon=$YABAI_GRID
  icon.color=$MAROON
  associated_display=active
)

front_app=(
  script="$PLUGIN_DIR/front_app.sh"
  icon.drawing=on
  padding_left=0
  label.color=$WHITE
  label.font="$FONT:Regular:14.0"
  icon.font="sketchybar-app-font:Regular:14.0"
)

sketchybar --add event window_focus            \
           --add event windows_on_spaces       \
           --add item yabai left               \
           --set yabai "${yabai[@]}"           \
           --subscribe yabai window_focus      \
                             windows_on_spaces \
                             mouse.clicked     \
                                               \
           --add item front_app left           \
           --set front_app "${front_app[@]}"   \
           --subscribe front_app front_app_switched
