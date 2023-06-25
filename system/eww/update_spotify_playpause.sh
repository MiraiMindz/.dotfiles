#!/usr/bin/env bash

playerctl  --player=spotify play-pause
eww update playstate="$(playerctl status)"

#if [[ $(playerctl status) == "Playing" ]]; then
#  eww update playstate="$(playerctl status)"
#else
#fi
