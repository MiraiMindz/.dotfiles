#!/usr/bin/env bash

## Author  : Aditya Shakya
## Mail    : adi1090x@gmail.com
## Github  : @adi1090x
## Twitter : @adi1090x

style="$($HOME/.config/rofi/applets/menu/style.sh)"

dir="$HOME/.config/rofi/applets/menu/configs/$style"
rofi_command="rofi -theme $dir/confs.rasi"

if [[ -f $HOME/.dotfiles/environment/variables/.env ]]; then
	source $HOME/.dotfiles/environment/variables/.env
fi

# Links
files=""
audio=""
fonts=""
appearance=""

# Error msg
msg() {
	rofi -theme "$HOME/.config/rofi/applets/styles/message.rasi" -e "$1"
}

# Variable passed to rofi
options="$audio\n$appearance\n$fonts\n$files"

chosen="$(echo -e "$options" | $rofi_command -p "Most Used" -dmenu -selected-row 0)"
case $chosen in
	$audio)
		if [[ -f $(which pavucontrol) ]]; then
            pavucontrol &
		else
			msg "Audio Manager not found"
		fi
        ;;
    $fonts)
		if [[ -f $(which font-manager) ]]; then
            font-manager &
		else
			msg "Font Manager not found"
		fi
        ;;
    $appearance)
		if [[ -f $(which lxappearance) ]]; then
            lxappearance &
		else
			msg "Visual Manager not found"
		fi
        ;;
	$files)
		if [[ -f $(which thunar) ]]; then
			thunar &
		elif [[ -f $(which pcmanfm) ]]; then
			pcmanfm &
		else
			msg "File Manager not found"
		fi
        ;;
esac
