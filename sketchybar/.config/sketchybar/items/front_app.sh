#!/bin/bash

# FRONT_APP_SCRIPT='sketchybar --set $NAME label="$INFO"'

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
           --add item front_app left           \
           --set front_app "${front_app[@]}"   \
           --subscribe front_app front_app_switched