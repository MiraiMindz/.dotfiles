#!/bin/bash

# Directory for the cache
CACHE_DIR="$HOME/.cache/album_covers"
# rm -rfv $HOME/.cache/album_covers/*.img
# Create the cache directory if it doesn't exist

if [[ ! -d "$CACHE_DIR" ]]; then
  mkdir -pv "$CACHE_DIR"
fi

# Initialize the previous metadata
prev_metadata=""

while true; do
  # Use playerctl to get the metadata of the current song
  metadata=$(playerctl metadata --format '{{ artist }} - {{ title }}')

  # Check if the metadata has changed
  if [ "$metadata" != "$prev_metadata" ]; then
    # Extract the song title and artist from the metadata
    title=$(echo "$metadata" | cut -d'-' -f2 | awk '{$1=$1};1')
    artist=$(echo "$metadata" | cut -d'-' -f1 | awk '{$1=$1};1')


    image_url=$(playerctl metadata mpris:artUrl)
    filename="${image_url##*/}"
    image_path="$CACHE_DIR/$filename.jpg"
    # Download the image to the cache directory
    curl -fsL "$image_url" -o "${image_path}"

    echo "Album cover downloaded to ${image_path}"
    # Update the previous metadata
    prev_metadata="$metadata"

    # if [[ -f "$CACHE_DIR/output.png" ]]; then
    #   rm "$CACHE_DIR/output.png"
    # fi

    sh /home/mirai/.config/eww/round_images.sh "${image_path}"
    #cp "${image_path}" "${CACHE_DIR}/output.png"
    eww update songimage="${CACHE_DIR}/output.png"
  fi

  # Sleep for a short interval before checking again
  sleep 1
done
