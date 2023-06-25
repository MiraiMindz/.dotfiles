#!/usr/bin/env bash

# Check if ImageMagick is installed
if ! command -v convert >/dev/null 2>&1; then
  echo "ImageMagick is not installed. Please install it and try again."
  exit 1
fi

# Check if input file is provided
if [ -z "$1" ]; then
  echo "Usage: $0 <input_file>"
  exit 1
fi

input_file="$1"
filename="${input_file##*/}"
basepath=$(dirname -- "$input_file")
output_file="${basepath}/output.png"

convert "${input_file}" -gravity Center \( -size 640x640    xc:Black    -fill White    -draw 'circle 320 320 320 1'    -alpha Copy \) -compose CopyOpacity -composite -trim "${output_file}"
