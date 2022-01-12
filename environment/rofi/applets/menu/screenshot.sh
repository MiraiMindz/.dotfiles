#!/usr/bin/env bash

## Author  : Aditya Shakya
## Mail    : adi1090x@gmail.com
## Github  : @adi1090x
## Twitter : @adi1090x

style="$($HOME/.config/rofi/applets/menu/style.sh)"

dir="$HOME/.config/rofi/applets/menu/configs/$style"
rofi_command="rofi -theme $dir/screenshot.rasi"

# Error msg
msg() {
	rofi -theme "$HOME/.config/rofi/applets/styles/message.rasi" -e "Please install 'scrot' first."
}

# Options
allscreens=""
screen=""
area=""
window=""

# Variable passed to rofi
options="$allscreens\n$screen\n$area\n$window"

chosen="$(echo -e "$options" | $rofi_command -p 'spectacle' -dmenu -selected-row 1)"
case $chosen in
    $screen)
		if [[ -f /usr/bin/spectacle ]]; then
			sleep 1; spectacle -m -r -o /home/mirai/Imagens/Screenshot_%T_%Y%M%D_%H%m%S --copy-image
		else
			msg
		fi
        ;;
    $area)
		if [[ -f /usr/bin/spectacle ]]; then
			spectacle -r -o /home/mirai/Imagens/Screenshot_%T_%Y%M%D_%H%m%S --copy-image
		else
			msg
		fi
        ;;
    $window)
		if [[ -f /usr/bin/spectacle ]]; then
			spectacle -w -a -o /home/mirai/Imagens/Screenshot_%T_%Y%M%D_%H%m%S --copy-image
		else
			msg
		fi
        ;;
esac
