#!/usr/bin/env bash

## Author  : Aditya Shakya
## Mail    : adi1090x@gmail.com
## Github  : @adi1090x
## Twitter : @adi1090x

style="$($HOME/.config/rofi/applets/menu/style.sh)"

dir="$HOME/.config/rofi/applets/menu/configs/$style"
rofi_command="rofi -theme $dir/apps.rasi"

if [[ -f $HOME/.dotfiles/environment/variables/.env ]]; then
	source $HOME/.dotfiles/environment/variables/.env
fi

# Links
files=""
editor="﬏ "
rofi=""
quicklinks=""
scrcpy=""
discord=""

case $(xdg-settings get default-web-browser) in
	"firefox.desktop")
		browser=""
	;;
	"chrome.desktop")
		browser=""
	;;
	"chromium.desktop")
		browser=""
	;;
	"opera.desktop")
		browser=""
	;;
	*)
		browser=""
	;;
esac

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
		case $(xdg-settings get default-web-browser) in
			"firefox.desktop")
				if [[ -f $(which firefox) ]]; then
					firefox &
				else
					msg "firefox not found"
				fi
			;;
			"chrome.desktop")
				if [[ -f $(which chrome) ]]; then
					chrome &
				else
					msg "chrome not found"
				fi
			;;
			"chromium.desktop")
				if [[ -f $(which chromium) ]]; then
					chromium &
				else
					msg "chromium not found"
				fi
			;;
			"opera.desktop")
				if [[ -f $(which opera) ]]; then
					opera &
				else
					msg "opera not found"
				fi
			;;
			*)
				if [[ -f $(which brave) ]]; then
					brave &
				else
					msg "browser not found"
				fi
			;;
		esac
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
			if [[ -f $HOME/.dotfiles/environment/variables/.env ]]; then
				adb kill-server &
				kilall -q adb &
				scrcpy --tcpip="${ADBDEVIP}:5555" --turn-screen-off &
				sleep 2
				notify-send "ADB" "$(adb devices -l)" &
			else
				kilall -q adb &
				notify-send "ADB" "$(adb devices -l)" &
				sleep 2
				scrcpy --turn-screen-off &
			fi
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
