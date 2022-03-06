#!/usr/bin/env bash

## Author  : Aditya Shakya
## Mail    : adi1090x@gmail.com
## Github  : @adi1090x
## Twitter : @adi1090x

style="$($HOME/.config/rofi/applets/menu/style.sh)"

dir="$HOME/.config/rofi/applets/menu/configs/$style"
rofi_command="rofi -theme $dir/editors.rasi"

# Links
vscode="﬏ "
vim=""
mark=""

# Error msg
msg() {
	rofi -theme "$HOME/.config/rofi/applets/styles/message.rasi" -e "$1"
}

# Variable passed to rofi
options="$vscode\n$vim\n$mark"

chosen="$(echo -e "$options" | $rofi_command -p "Select One" -dmenu -selected-row 0)"
case $chosen in
    $vscode)
		if [[ -f $(which vscode) ]]; then
            vscode &
        else
			msg "Visual Studio Code not found"
		fi
        ;;
    $vim)
		if [[ -f $HOME/.config/rofi/applets/menu/vimterms.sh ]]; then
			sh $HOME/.config/rofi/applets/menu/vimterms.sh &
		else
			msg "VimTerms not found"
		fi
        ;;
    $mark)
		if [[ -f $(which marktext) ]]; then
            marktext &
        else
			msg "MarkText not found"
		fi
        ;;
esac
