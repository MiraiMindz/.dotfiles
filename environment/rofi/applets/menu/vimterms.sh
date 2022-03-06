#!/usr/bin/env bash

## Author  : Aditya Shakya
## Mail    : adi1090x@gmail.com
## Github  : @adi1090x
## Twitter : @adi1090x

style="$($HOME/.config/rofi/applets/menu/style.sh)"

dir="$HOME/.config/rofi/applets/menu/configs/$style"
rofi_command="rofi -theme $dir/vimterms.rasi"

# Links
ctr=""
terminator=""

# Error msg
msg() {
	rofi -theme "$HOME/.config/rofi/applets/styles/message.rasi" -e "$1"
}

# Variable passed to rofi
options="$ctr\n$terminator"

chosen="$(echo -e "$options" | $rofi_command -p "VIM/NVIM" -dmenu -selected-row 0)"
case $chosen in
    $ctr)
		if [[ -f $(which cool-retro-term) ]]; then
            if [[ -f $(which nvim) ]]; then
                cool-retro-term -e nvim &
            elif [[ -f $(which vim) ]]; then
                cool-retro-term -e vim &
            fi
		fi
        ;;
    $terminator)
		if [[ -f $(which terminator) ]]; then
            if [[ -f $(which nvim) ]]; then
                terminator -e nvim &
            elif [[ -f $(which vim) ]]; then
                terminator -e vim &
            fi
		fi
        ;;
esac
