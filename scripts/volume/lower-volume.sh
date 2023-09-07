#!/bin/bash

if bluetoothctl info | grep -q "Icon: audio-headset"; then
    wpctl set-volume -l 0.6 @DEFAULT_AUDIO_SINK@ 3%-
    pkill -RTMIN+8 waybar
else
    wpctl set-volume -l 1.0 @DEFAULT_AUDIO_SINK@ 5%-
    pkill -RTMIN+8 waybar
  fi
