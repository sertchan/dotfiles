#!/bin/bash

memory_info=$(free --bytes | awk '/Mem/ {print $3}')

if (( $(echo "$memory_info < (1000^3)" | bc -l) )); then
    used_memory=$(echo "scale=1; $memory_info / (1000^3)" | bc)
    used_memory="0$used_memory"  
  else
    used_memory=$(echo "scale=1; $memory_info / (1000^3)" | bc)
fi

echo "$used_memory"
