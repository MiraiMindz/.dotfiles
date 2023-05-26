#!/usr/bin/env bash

## Author  : Aditya Shakya
## Mail    : adi1090x@gmail.com
## Github  : @adi1090x
## Twitter : @adi1090x

style="$($HOME/.config/rofi/applets/menu/style.sh)"

dir="$HOME/.config/rofi/applets/menu/configs/$style"
rofi_command="rofi -theme $dir/musicplay.rasi"

# Links
spotify=""
pragha=""

# Error msg
msg() {
	rofi -theme "$HOME/.config/rofi/applets/styles/message.rasi" -e "$1"
}

# Variable passed to rofi
options="$spotify\n$pragha"

chosen="$(echo -e "$options" | $rofi_command -p "Players" -dmenu -selected-row 0)"
case $chosen in
    $spotify)
		if [[ -f $(which spotify) ]]; then
            spotify &
        else
            msg "Spotify not found"
		fi
        ;;
    $pragha)
		if [[ -f $(which pragha) ]]; then
            pragha &
        else
            msg "Pragha not found"
		fi
        ;;
esac
