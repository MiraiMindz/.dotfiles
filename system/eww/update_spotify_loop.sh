#!/bin/bash

# Get the current loop status
loop_status=$(playerctl --player=spotify loop)

# Define the loop modes in an array
loop_modes=("None" "Playlist" "Track")

# Find the index of the current loop status in the loop_modes array
current_index=0
for ((i=0; i<${#loop_modes[@]}; i++)); do
    if [ "${loop_modes[$i]}" = "$loop_status" ]; then
        current_index=$i
        break
    fi
done

# Calculate the next loop mode index
next_index=$(( (current_index + 1) % ${#loop_modes[@]} ))

# Set the loop mode to the next mode
playerctl --player=spotify loop "${loop_modes[$next_index]}"

# Display the updated loop status
updated_loop_status="${loop_modes[$next_index]}"

case $updated_loop_status in
    "None")
        eww update loopstate="None"
    ;;

    "Playlist")
        eww update loopstate="Playlist"
    ;;

    "Track")
        eww update loopstate="Track"
    ;;

    *)
        eww update loopstate="None"
    ;;
esac
