#!/usr/bin/env bash

if [[ -e $(which wine) ]]; then
    if [[ -e "$HOME/.wine/drive_c/Program Files/Image-Line/FL Studio 20/FL64.exe" ]]; then
        wine "C:\Program Files\Image-Line\FL Studio 20\FL64.exe"
    fi
fi
