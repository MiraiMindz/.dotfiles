#!/usr/bin/env bash

pidof eww >/dev/null && killall -q eww || eww daemon
eww open bar
eww open spotifysong
eww open sysmonitors
eww open powermenubar
