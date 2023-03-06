#!/usr/bin/env bash

## Author  : Aditya Shakya
## Mail    : adi1090x@gmail.com
## Github  : @adi1090x
## Twitter : @adi1090x

style="$($HOME/.config/rofi/applets/menu/style.sh)"

dir="$HOME/.config/rofi/applets/menu/configs/$style"
rofi_command="rofi -theme $dir/browser.rasi"

# Links
firefox=""
chromium=""
opera=""

# Error msg
msg() {
	rofi -theme "$HOME/.config/rofi/applets/styles/message.rasi" -e "$1"
}

# Variable passed to rofi
options="$firefox\n$chromium\n$opera"

chosen="$(echo -e "$options" | $rofi_command -p "Select One" -dmenu -selected-row 0)"
case $chosen in
	$firefox)
		if [[ -f $(which firefox) ]]; then
			firefox &
		else
			msg "firefox not found"
		fi
		;;
	$chromium)
		if [[ -f $(which chromium) ]]; then
			chromium &
		else
			msg "chromium not found"
		fi
		;;
	$opera)
		if [[ -f $(which opera) ]]; then
			opera &
		else
			msg "opera not found"
		fi
		;;
esac
