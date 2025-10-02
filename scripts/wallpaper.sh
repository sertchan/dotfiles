#!/bin/bash

set_wallpaper() {
  swww init
  last_wallpaper=""
  while true; do
    wallpapers=($(find "$HOME/Pictures/Wallpapers/" -type f \( -iname "*.jpg" -o -iname "*.jpeg" -o -iname "*.png" -o -iname "*.webp" \)))
    while true; do
      current_wallpaper=${wallpapers[RANDOM % ${#wallpapers[@]}]}
      if [ "$current_wallpaper" != "$last_wallpaper" ]; then
        break
      fi
    done
    swww img "$current_wallpaper" -t center --transition-duration 0.7 --transition-fps 75 
    last_wallpaper="$current_wallpaper"
    sleep 1h 
  done
}

set_wallpaper
