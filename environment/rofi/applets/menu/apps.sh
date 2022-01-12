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
		if [[ -f $(which thunar) ]]; then
			thunar &
		elif [[ -f $(which pcmanfm) ]]; then
			pcmanfm &
		else
			msg "Thunar not found"
		fi
        ;;
    $editor)
		if [[ -f $(which geany) ]]; then
			geany &
		elif [[ -f $(which leafpad) ]]; then
			leafpad &
		elif [[ -f $(which mousepad) ]]; then
			mousepad &
		elif [[ -f  $(which vscode) ]]; then
			vscode &
		else
			msg "Code not found"
		fi
        ;;
    $browser)
		if [[ -f $(which brave) ]]; then
			brave &
		else
			msg "Code not found"
		fi
        ;;
    $rofi)
		if [[ -f $(which rofi) ]]; then
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
		if [[ -f $(which scrcpy) ]]; then
			scrcpy &
		else
			msg "Scrcpy not found"
		fi
        ;;
	$discord)
		if [[ -f $(which discord) ]]; then
			discord &
		else
			msg "Discord not found"
		fi
        ;;
esac