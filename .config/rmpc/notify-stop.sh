#!/usr/bin/env sh

current_rmpc=$(pidof rmpc)

output=$(rmpc remote --pid "$current_rmpc" keybind s)
exit_code=$?

if [ $exit_code -ne 0 ]; then
  notify-send -i "Error: ${output}"
  exit $exit_code
fi
notify-send " Music Player Stopped"
exit $exit_code
