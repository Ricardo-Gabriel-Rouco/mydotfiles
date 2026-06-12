#!/usr/bin/env sh

TEMP_DIR="/tmp/rmpc/"

mkdir -p $TEMP_DIR

ALBUM_ART_PATH="$TMP_DIR/notification_cover"

# default_album_art in case everything goes to the puta
DEFAULT_ALBUM_ART_PATH="$TMP_DIR/default_album_art.jpg"

if ! rmpc albumart --output "$ALBUM_ART_PATH"; then
  # Use default album art if rmpc returns non-zero exit code
  ALBUM_ART_PATH="${DEFAULT_ALBUM_ART_PATH}"
fi

# Send the notification
notify-send -h string:x-dunst-stack-tag:song_tag -h string:value:"${ALBUM_ART_PATH}" -h string:value:"${ARTIST}" -h string:value:"${TITLE}" -i "${ALBUM_ART_PATH}" " Now Playing" "$ARTIST - $TITLE"
