#!/bin/bash

CONFIG_FILES=("$HOME/.config/waybar/config" "$HOME/.config/waybar/style.css")

if ! pgrep -x "waybar" > /dev/null; then
  waybar --log-level error &
fi

while true; do
    inotifywait -e modify "${CONFIG_FILES[@]}"
    killall waybar
    waybar --log-level error &
done
