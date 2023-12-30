#!/bin/bash

if bluetoothctl info | grep -q "Icon: audio-headset"; then
    wpctl set-volume -l 1.0 @DEFAULT_AUDIO_SINK@ 2%-
else
    wpctl set-volume -l 1.0 @DEFAULT_AUDIO_SINK@ 2%-
  fi
