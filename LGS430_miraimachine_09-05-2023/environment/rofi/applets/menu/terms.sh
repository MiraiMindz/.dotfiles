#!/usr/bin/env bash

## Author  : Aditya Shakya
## Mail    : adi1090x@gmail.com
## Github  : @adi1090x
## Twitter : @adi1090x

style="$($HOME/.config/rofi/applets/menu/style.sh)"

dir="$HOME/.config/rofi/applets/menu/configs/$style"
rofi_command="rofi -theme $dir/terms.rasi"

# Links
ctr=""
terminator=""

# Error msg
msg() {
    rofi -theme "$HOME/.config/rofi/applets/styles/message.rasi" -e "$1"
}

# Variable passed to rofi
options="$terminator\n$ctr"

chosen="$(echo -e "$options" | $rofi_command -p "Terminator/CTR" -dmenu -selected-row 0)"
case $chosen in
    $ctr)
        if [[ -f $(which cool-retro-term) ]]; then
            cool-retro-term &
        fi
        ;;
    $terminator)
        if [[ -f $(which terminator) ]]; then
            terminator &
        fi
        ;;
esac
