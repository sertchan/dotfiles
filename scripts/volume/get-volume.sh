#!/bin/bash

raw_volume=$(wpctl get-volume @DEFAULT_AUDIO_SINK@ | awk '{print $2}') 

if bluetoothctl info | grep -q "Icon: audio-headset"; then
  volume=$(echo "$raw_volume * 100^2 / 60" | bc)
else
  volume=$(echo "$raw_volume * 100^2 /100" | bc)
fi

echo "$volume"
