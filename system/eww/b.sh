#!/bin/bash

# Get the X11 window ID of the currently focused window
window_id=$(xdo id -n "$(bspc query -N -n focused)")

# Get the window name using xprop
window_name=$(xprop -id "$window_id" | awk -F '"' '/WM_NAME/{print $2}')

# Print the window name
echo "Currently focused window: $window_name"
