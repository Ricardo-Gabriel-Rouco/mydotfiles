#!/usr/bin/env sh

case "${1}" in
  up)
    rmpc remote keybind "."
    ;;
  down)
    rmpc remote keybind ","
    ;;
esac

status=$(rmpc status 2>&1)
state=$(echo "$status" | jq -r '.volume' 2>/dev/null)

notify-send -h string:x-dunst-stack-tag:vol_tag -h int:value:"${state}" "  Volume ${state}%"
