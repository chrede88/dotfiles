#!/bin/bash

zen_on() {
  sketchybar --set github.bell drawing=off \
             --set '/cpu.*/' drawing=off \
             --set separator drawing=off \
             --set front_app drawing=off \
             --set volume drawing=off \
             --set brew drawing=off \
             --set battery drawing=off
}

zen_off() {
  sketchybar --set github.bell drawing=on \
             --set '/cpu.*/' drawing=on \
             --set separator drawing=on \
             --set front_app drawing=on \
             --set volume drawing=on \
             --set brew drawing=on \
             --set battery drawing=off
}

if [ "$1" = "on" ]; then
  zen_on
elif [ "$1" = "off" ]; then
  zen_off
else
  if [ "$(sketchybar --query github.bell | jq -r ".geometry.drawing")" = "on" ]; then
    zen_on
  else
    zen_off
  fi
fi