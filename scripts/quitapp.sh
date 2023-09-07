#!/bin/bash

# Store the window class of the active window in a variable
window_class=$(hyprctl activewindow -j | jq -r ".class")

# Check if the active window's class is "Steam"
if [ "$window_class" = "Steam" ]; then
    # If it is, use xdotool to unmap (hide) the active window
    xdotool getactivewindow windowunmap
else
    # If it's not "Steam", use hyprctl to dispatch a killactive command
    hyprctl dispatch killactive ""
fi
