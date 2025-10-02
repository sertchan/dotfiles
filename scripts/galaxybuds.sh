#!/bin/bash

connect () {
  while ! bluetoothctl info | grep -q "Connected: yes" > /dev/null; do 
    bluetoothctl power off
    bluetoothctl power on
    bluetoothctl connect 64:5D:F4:64:E3:65
  done
}

disconnect () {
  while bluetoothctl info | grep -q "Connected: yes" > /dev/null; do 
    bluetoothctl disconnect
    bluetoothctl power off
  done
}

reset() {
   sudo systemctl stop bluetooth.service
}

if [ "$1" == "connect" ]; then
  connect  
elif [ "$1" == "disconnect" ]; then
 disconnect 
elif [ "$1" == "reset" ]; then
  reset
else
  echo "Use: $0 [connect|reset]"
fi
