#!/usr/bin/env bash

## Author  : Aditya Shakya
## Mail    : adi1090x@gmail.com
## Github  : @adi1090x
## Twitter : @adi1090x

style="$($HOME/.config/rofi/applets/menu/style.sh)"

dir="$HOME/.config/rofi/applets/menu/configs/$style"
rofi_command="rofi -theme $dir/apps.rasi"

# Links
files=""
editor="﬏ "
#browser=""
browser=""
rofi=""
quicklinks=""
scrcpy=""
discord=""


# Error msg
msg() {
	rofi -theme "$HOME/.config/rofi/applets/styles/message.rasi" -e "$1"
}

# Variable passed to rofi
options="$rofi\n$discord\n$browser\n$editor\n$files\n$scrcpy\n$quicklinks"

chosen="$(echo -e "$options" | $rofi_command -p "Most Used" -dmenu -selected-row 0)"
case $chosen in
    $files)
		if [[ -f /usr/bin/thunar ]]; then
			thunar &
		elif [[ -f /usr/bin/pcmanfm ]]; then
			pcmanfm &
		else
			msg "Thunar not found"
		fi
        ;;
    $editor)
		if [[ -f /usr/bin/geany ]]; then
			geany &
		elif [[ -f /usr/bin/leafpad ]]; then
			leafpad &
		elif [[ -f /usr/bin/mousepad ]]; then
			mousepad &
		elif [[ -f  $HOME/Apps/VisualStudioCode/code ]]; then
			vscode &
		else
			msg "Code not found"
		fi
        ;;
    $browser)
		if [[ -f /usr/bin/firefox ]]; then
			firefox &
		fi
        ;;
    $rofi)
		if [[ -f /usr/bin/rofi ]]; then
			rofi -show run &
		else
			msg "Rofi not found"
		fi
        ;;
    $quicklinks)
		if [[ -f $HOME/.config/rofi/bin/menu_quicklinks ]]; then
			bash  $HOME/.config/rofi/bin/menu_quicklinks &
		else
			msg "Quicklinks not found"
		fi
        ;;
	$scrcpy)
		if [[ -f /usr/bin/scrcpy ]]; then
			scrcpy &
		else
			msg "Scrcpy not found"
		fi
        ;;
	$discord)
		if [[ -f /usr/bin/discord ]]; then
			discord &
		else
			msg "Discord not found"
		fi
        ;;
esac
