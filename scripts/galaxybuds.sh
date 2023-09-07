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
  if bluetoothctl info | grep -q "Connected: yes"; then
    bluetoothctl disconnect
  fi

  while ! bluetoothctl info | grep -q "Connected: yes" > /dev/null; do 
    bluetoothctl power off
    bluetoothctl power on
    bluetoothctl connect 64:5D:F4:64:E3:65
  done
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
