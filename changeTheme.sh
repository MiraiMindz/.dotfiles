#!/usr/bin/env bash

replaceline() {
	sed -i "$1s/.*/$2/" $3
}

testNotify() {
    if [[ -e $(which notify-send) ]]; then
        killall -q dunst
        notify-send -u low "Head Low" "Body Low"
        notify-send -u normal "Head Normal" "Body Normal"
        notify-send -u critical "Head Critical" "Body Critical"
    fi
}

setNord() {
    # Changes Terminator Theme
    replaceline 2454 "      profile = Nord" $HOME/.dotfiles/terminals/terminator/config

    # Changes DunstRC Config
    rm -v $HOME/.config/dunst/dunstrc
    ln -v -sf $HOME/.dotfiles/environment/dunst/Nord $HOME/.config/dunst/dunstrc
    printf "%s\n" "Testing Notification"
    testNotify

    # Change Firefox chrome colors & startpage default theme
    rm -v $HOME/.dotfiles/environment/firefox/stylesheets/chrome/Theme
    ln -v -sf $HOME/.dotfiles/environment/firefox/stylesheets/Themes/Nord $HOME/.dotfiles/environment/firefox/stylesheets/chrome/Theme
    replaceline 10 '        <link rel="stylesheet" type="text\/css" id="CSSSwitcher" href=".\/CSS\/ColorsStyles\/NordStyle.css">' $HOME/.dotfiles/environment/firefox/startpages/Chill/index.html

    # Change Polybar
    rm -v $HOME/.dotfiles/environment/polybar/config.ini
    ln -v -sf $HOME/.dotfiles/environment/polybar/Themes/Nord.ini $HOME/.dotfiles/environment/polybar/config.ini

    # Change Rofi Themes
    replaceline 7 '@theme "\/usr\/share\/rofi\/themes\/Nord.rasi"' $HOME/.dotfiles/environment/rofi/config.rasi
    replaceline 22 '@import "NordTheme.rasi"' $HOME/.dotfiles/environment/rofi/applets/styles/colors.rasi

    # Change i3 Config
    ln -v -sf $HOME/.dotfiles/environment/i3wm/Themes/Nord $HOME/.dotfiles/environment/i3wm/config
    if [[ -e $(which i3-msg) ]]; then
        i3-msg restart
        if [[ -e $(which notify-send) ]]; then
            notify-send -u critical "Theme Changer" "If necessary kill the hideIt.sh process"
            printf "%s\n" "If necessary kill the hideIt.sh process"
        else
            printf "%s\n" "If necessary kill the hideIt.sh process"
        fi
    fi

    # Root area
    # Change Cool-Retro-Term color
    sudo rm -v /usr/lib/qt/qml/QMLTermWidget/color-schemes/cool-retro-term.colorscheme
    sudo ln -v -sf $HOME/.dotfiles/terminals/cool-retro-term/Themes/Nord.colorscheme /usr/lib/qt/qml/QMLTermWidget/color-schemes/cool-retro-term.colorscheme
    # Change SDDM Theme
    sudo rm -v /usr/share/sddm/themes/Sugar-Candy/theme.conf
    sudo cp -v $HOME/.dotfiles/environment/sddm/Themes/Colors/Nord.conf /usr/share/sddm/themes/Sugar-Candy/theme.conf

    # Send Notify
    if [[ -e $(which notify-send) ]]; then
        notify-send -u critical "Theme Changer" "Current Theme: Nord"
        printf "%s\n" "Current Theme: Nord"
    else
        printf "%s\n" "Current Theme: Nord"
    fi
}

setMaterialOcean() {
    # Changes Terminator Theme
    replaceline 2454 "      profile = Material Theme Ocean" $HOME/.dotfiles/terminals/terminator/config

    # Changes DunstRC Config
    rm -v $HOME/.config/dunst/dunstrc
    ln -v -sf $HOME/.dotfiles/environment/dunst/MaterialOcean $HOME/.config/dunst/dunstrc
    printf "%s\n" "Testing Notification"
    testNotify

    # Change Firefox chrome colors & startpage default theme
    rm -v $HOME/.dotfiles/environment/firefox/stylesheets/chrome/Theme
    ln -v -sf $HOME/.dotfiles/environment/firefox/stylesheets/Themes/MaterialOcean $HOME/.dotfiles/environment/firefox/stylesheets/chrome/Theme
    replaceline 10 '        <link rel="stylesheet" type="text\/css" id="CSSSwitcher" href=".\/CSS\/ColorsStyles\/MaterialOceanStyle.css">' $HOME/.dotfiles/environment/firefox/startpages/Chill/index.html

    # Change Polybar
    rm -v $HOME/.dotfiles/environment/polybar/config.ini
    ln -v -sf $HOME/.dotfiles/environment/polybar/Themes/MaterialOcean.ini $HOME/.dotfiles/environment/polybar/config.ini

    # Change Rofi Themes
    replaceline 7 '@theme "\/usr\/share\/rofi\/themes\/MaterialOcean.rasi"' $HOME/.dotfiles/environment/rofi/config.rasi
    replaceline 22 '@import "MaterialOceanTheme.rasi"' $HOME/.dotfiles/environment/rofi/applets/styles/colors.rasi

    # Change i3 Config
    ln -v -sf $HOME/.dotfiles/environment/i3wm/Themes/MaterialOcean $HOME/.dotfiles/environment/i3wm/config
    if [[ -e $(which i3-msg) ]]; then
        i3-msg restart
        if [[ -e $(which notify-send) ]]; then
            notify-send -u critical "Theme Changer" "If necessary kill the hideIt.sh process"
            printf "%s\n" "If necessary kill the hideIt.sh process"
        else
            printf "%s\n" "If necessary kill the hideIt.sh process"
        fi
    fi

    # Root area
    # Change Cool-Retro-Term color
    sudo rm -v /usr/lib/qt/qml/QMLTermWidget/color-schemes/cool-retro-term.colorscheme
    sudo ln -v -sf $HOME/.dotfiles/terminals/cool-retro-term/Themes/MaterialOcean.colorscheme /usr/lib/qt/qml/QMLTermWidget/color-schemes/cool-retro-term.colorscheme
    # Change SDDM Theme
    sudo rm -v /usr/share/sddm/themes/Sugar-Candy/theme.conf
    sudo cp -v $HOME/.dotfiles/environment/sddm/Themes/Colors/MaterialOcean.conf /usr/share/sddm/themes/Sugar-Candy/theme.conf

    # Send Notify
    if [[ -e $(which notify-send) ]]; then
        notify-send -u critical "Theme Changer" "Current Theme: MaterialOcean"
        printf "%s\n" "Current Theme: MaterialOcean"
    else
        printf "%s\n" "Current Theme: MaterialOcean"
    fi
}

setDracula() {
    # Changes Terminator Theme
    replaceline 2454 "      profile = Dracula" $HOME/.dotfiles/terminals/terminator/config

    # Changes DunstRC Config
    rm -v $HOME/.config/dunst/dunstrc
    ln -v -sf $HOME/.dotfiles/environment/dunst/Dracula $HOME/.config/dunst/dunstrc
    printf "%s\n" "Testing Notification"
    testNotify

    # Change Firefox chrome colors & startpage default theme
    rm -v $HOME/.dotfiles/environment/firefox/stylesheets/chrome/Theme
    ln -v -sf $HOME/.dotfiles/environment/firefox/stylesheets/Themes/Dracula $HOME/.dotfiles/environment/firefox/stylesheets/chrome/Theme
    replaceline 10 '        <link rel="stylesheet" type="text\/css" id="CSSSwitcher" href=".\/CSS\/ColorsStyles\/DraculaStyle.css">' $HOME/.dotfiles/environment/firefox/startpages/Chill/index.html

    # Change Polybar
    rm -v $HOME/.dotfiles/environment/polybar/config.ini
    ln -v -sf $HOME/.dotfiles/environment/polybar/Themes/Dracula.ini $HOME/.dotfiles/environment/polybar/config.ini

    # Change Rofi Themes
    replaceline 7 '@theme "\/usr\/share\/rofi\/themes\/Dracula.rasi"' $HOME/.dotfiles/environment/rofi/config.rasi
    replaceline 22 '@import "DraculaTheme.rasi"' $HOME/.dotfiles/environment/rofi/applets/styles/colors.rasi

    # Change i3 Config
    ln -v -sf $HOME/.dotfiles/environment/i3wm/Themes/Dracula $HOME/.dotfiles/environment/i3wm/config
    if [[ -e $(which i3-msg) ]]; then
        i3-msg restart
        if [[ -e $(which notify-send) ]]; then
            notify-send -u critical "Theme Changer" "If necessary kill the hideIt.sh process"
            printf "%s\n" "If necessary kill the hideIt.sh process"
        else
            printf "%s\n" "If necessary kill the hideIt.sh process"
        fi
    fi

    # Root area
    # Change Cool-Retro-Term color
    sudo rm -v /usr/lib/qt/qml/QMLTermWidget/color-schemes/cool-retro-term.colorscheme
    sudo ln -v -sf $HOME/.dotfiles/terminals/cool-retro-term/Themes/Dracula.colorscheme /usr/lib/qt/qml/QMLTermWidget/color-schemes/cool-retro-term.colorscheme
    # Change SDDM Theme
    sudo rm -v /usr/share/sddm/themes/Sugar-Candy/theme.conf
    sudo cp -v $HOME/.dotfiles/environment/sddm/Themes/Colors/Dracula.conf /usr/share/sddm/themes/Sugar-Candy/theme.conf

    # Send Notify
    if [[ -e $(which notify-send) ]]; then
        notify-send -u critical "Theme Changer" "Current Theme: Dracula"
        printf "%s\n" "Current Theme: Dracula"
    else
        printf "%s\n" "Current Theme: Dracula"
    fi
}

printf "%s\n" "Theme Changer"
printf "%s\n" "1. Material Ocean"
printf "%s\n" "2. Nord"
printf "%s\n" "3. Dracula"
printf "%s\n" "0. Exit"
read -e -p "Select Theme: " THEME
case $THEME in
    "1" | 1)
        setMaterialOcean
    ;;
    "2" | 2)
        setNord
    ;;
    "3" | 3)
        setDracula
    ;;
    "0" | 0)
        exit
    ;;
    *)
    printf "Invalid input, try again\n"
    ;;
esac

# #setMaterialOcean
# #setNord
# setDracula










