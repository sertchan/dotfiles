#!/bin/bash

if pgrep -x "wofi" > /dev/null; then
    pkill -x "wofi"
fi
wofi --show drun

