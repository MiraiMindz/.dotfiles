#!/usr/bin/env bash

## Author  : Aditya Shakya
## Mail    : adi1090x@gmail.com
## Github  : @adi1090x
## Twitter : @adi1090x

style="$($HOME/.config/rofi/applets/menu/style.sh)"

dir="$HOME/.config/rofi/applets/menu/configs/$style"
rofi_command="rofi -theme $dir/quicklinks.rasi"

# Error msg
msg() {
	rofi -theme "$HOME/.config/rofi/applets/styles/message.rasi" -e "$1"
}

# Browser
if [[ -f /usr/bin/firefox ]]; then
	app="Firefox"
elif [[ -f /usr/bin/chromium ]]; then
	app="chromium"
elif [[ -f /usr/bin/midori ]]; then
	app="midori"
elif [[ -e /usr/bin/brave ]]; then
    app="brave"
else
	msg "No suitable web browser found!"
	exit 1
fi

# Links
google=""
reddit=""
github=""
youtube=""

# Variable passed to rofi
options="$google\n$reddit\n$github\n$youtube"

chosen="$(echo -e "$options" | $rofi_command -p "Open In  :  $app" -dmenu -selected-row 0)"
case $chosen in
    $google)
        $app https://www.google.com &
        ;;
    $reddit)
        $app https://www.reddit.com &
        ;;
    $github)
        $app https://www.github.com &
        ;;
    $youtube)
        $app https://www.youtube.com &
        ;;
esac
