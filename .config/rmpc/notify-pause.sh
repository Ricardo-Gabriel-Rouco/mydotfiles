#!/usr/bin/env sh

current_rmpc=$(pidof rmpc)

rmpc remote --pid "$current_rmpc" keybind p

status=$(rmpc status 2>&1)
exit_code=$?

if [ $exit_code -ne 0 ]; then
  notify-send "Error" "$status"
  exit $exit_code
fi

state=$(echo "$status" | jq -r '.state' 2>/dev/null)

if [ "$state" = "Play" ]; then
  notify-send " Music Player Running"
elif [ "$state" = "Pause" ]; then
  notify-send " Music Player Paused"
fi
