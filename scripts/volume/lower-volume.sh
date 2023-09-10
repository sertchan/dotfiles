#!/bin/bash

if bluetoothctl info | grep -q "Icon: audio-headset"; then
    wpctl set-volume -l 0.8 @DEFAULT_AUDIO_SINK@ 5%-
else
    wpctl set-volume -l 1.2 @DEFAULT_AUDIO_SINK@ 5%-
  fi
