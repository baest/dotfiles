#!/usr/bin/env bash

#Checks for low memory.

threshold=88
has_low_mem=1

while :; do

  mem_usage=$(free -m | awk 'NR==2{printf "%.0f\n", $3*100/$2 }')

  if [ $threshold -gt $mem_usage ]; then
    has_low_mem=""
  fi

  if [ -z "$has_low_mem" ]; then
    if [ $threshold -lt $mem_usage ]; then
      notify-send --urgency=critical "Low memory"
    fi
  fi

  sleep 30

done

exit
