#!/usr/bin/env bash

winepref=/media/Arquivos/WineStuff/.wineFLStudio

if [[ -e $(which wine) ]]; then
    if [[ -e "$winepref/drive_c/Program Files/Image-Line/FL Studio 20/FL64.exe" ]]; then
        WINEPREFIX=/media/Arquivos/WineStuff/.wineFLStudio wine "C:\Program Files\Image-Line\FL Studio 20\FL.exe"
    fi
fi
