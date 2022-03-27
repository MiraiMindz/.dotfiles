#!/usr/bin/env bash

### Variables
### - Text Styles
DARK_BLACK='\e[30m'
DARK_RED='\e[31m'
DARK_GREEN='\e[32m'
DARK_YELLOW='\e[33m'
DARK_BLUE='\e[34m'
DARK_PURPLE='\e[35m'
DARK_CYAN='\e[36m'
DARK_WHITE='\e[37m'
LIGHT_BLACK='\e[90m'
LIGHT_RED='\e[91m'
LIGHT_GREEN='\e[92m'
LIGHT_YELLOW='\e[93m'
LIGHT_BLUE='\e[94m'
LIGHT_PURPLE='\e[95m'
LIGHT_CYAN='\e[96m'
LIGHT_WHITE='\e[97m'
TEXTBOLD_ON='\e[1m'
TEXTFAINT_ON='\e[2m'
TEXTITALIC_ON='\e[3m'
TEXTUNDERLN_ON='\e[4m'
TEXTBLINK_ON='\e[5m'
TEXTHIGHLT_ON='\e[7m'
TEXTHIDDEN_ON='\e[8m'
TEXTSTRIKE_ON='\e[9m'
TEXTBOLD_OFF='\e[21m'
TEXTFAINT_OFF='\e[22m'
TEXTITALIC_OFF='\e[23m'
TEXTUNDERLN_OFF='\e[24m'
TEXTBLINK_OFF='\e[25m'
TEXTHIGHLT_OFF='\e[27m'
TEXTHIDDEN_OFF='\e[28m'
TEXTSTRIKE_OFF='\e[29m'
NOCOLOR='\e[39m'
TEXTRESETALL='\e[m'

### - Folders
BACKUPFOLDER=$HOME/old_config_backup
DOTFILESDIR=$HOME/.dotfiles

### Functions
### - Support Functions
mkbkp() {
    mkdir -v -p $1
    mv -v $2/* $1/
    printf "%s\n" "Backup done, proceeding with Installation."
}

initgit() {
    if [[ -e $(which gh) ]]; then
        printf "%s\n" "Github CLI is installed: $(which gh)"
        cd $DOTFILESDIR/
        git init -b main
        git add .
        git commit -m "created .dotfiles repo from script"
        gh repo create
        cd $HOME
    else
        printf "%s\n" "Github CLI was not found, please create a Github repository and come back to this script"
        echo -e -n "Do you have created the repository (${DARK_GREEN}y${NOCOLOR}/${DARK_RED}n${NOCOLOR})? "
        old_stty_cfg=$(stty -g)
        stty raw -echo
        answer=$( while ! head -c 1 | grep -i '[ny]' ;do true ;done )
        stty $old_stty_cfg
        if echo "$answer" | grep -iq "^y" ;then
            cd $DOTFILESDIR/
            git init -b main
            git add .
            git commit -m "created .dotfiles repo from script"
            printf "%s" "Please insert the github repository URL: "
            git remote add origin
            git remote -v && git push
            cd $HOME
        else
            printf "%s\n" "${DARK_RED}Exiting${NOCOLOR}"
        fi
    fi
}

createDotfiles_BackupDir() {
    if [[ -d $BACKUPFOLDER ]]; then
        printf "%s\n" "${DARK_BLUE}$BACKUPFOLDER${NOCOLOR} Directory Already Exists"
        RANDCODE=$(< /dev/urandom tr -dc @=A-Z-a-z-0-9 | head -c${1:-8};echo;)
        NBKP="old_config_backup_${RANDCODE}"
        mkdir -v $HOME/NBKP
        mv -v BACKUPFOLDER/* $HOME/NBKP
    else
        printf "%s\n" "Creating ${DARK_BLUE}$BACKUPFOLDER${NOCOLOR} Directory"
        mkdir -v $BACKUPFOLDER/
    fi

    if [[ -d $HOME/.dotfiles ]];  then
        printf "%s\n" "${DARK_BLUE}$DOTFILESDIR${NOCOLOR} Directory Already Exists"
        printf "%s\n" "Backing up"
        mv -v $DOTFILESDIR/* $BACKUPFOLDER/
        mv -v * $DOTFILESDIR/
    else
        printf "%s\n" "Creating ${DARK_BLUE}$DOTFILESDIR${NOCOLOR} Directory"
        mkdir -v $DOTFILESDIR
        mv -v * $DOTFILESDIR/
    fi
}

checkPackages() {
    _checkPkgs() {
        if [[ -e $(which $1) ]]; then
            printf "%s\n" "$1 is ${DARK_GREEN}INSTALLED${NOCOLOR}"
        else
            printf "%s\n" "$1 is ${DARK_RED}MISSING${NOCOLOR}"
        fi
    }
    _checkPkgs "bash"
    _checkPkgs "zsh"
    _checkPkgs "i3"
    _checkPkgs "picom"
    _checkPkgs "polybar"
    _checkPkgs "terminator"
    _checkPkgs "cool-retro-term"
    _checkPkgs "firefox"
    _checkPkgs "neofetch"
    _checkPkgs "vim"
    _checkPkgs "neovim"
    _checkPkgs "vi"
    _checkPkgs "rofi"
    if [[ -d $HOME/.config/rofi ]]; then
        printf "%s\n" "Rofi Applets is ${DARK_GREEN}INSTALLED${NOCOLOR}"
    else
        printf "%s\n" "Rofi Applets is ${DARK_RED}MISSING${NOCOLOR}"
    fi
    _checkPkgs "sddm"
    if [[ -d /usr/share/sddm/themes/Sugar-Candy ]]; then
        printf "%s\n" "SDDM Sugar Candy Theme is ${DARK_GREEN}INSTALLED${NOCOLOR}"
    else
        printf "%s\n" "SDDM Sugar Candy Theme is ${DARK_RED}MISSING${NOCOLOR}"
    fi
}

changeRiceTheme() {
    _replaceline() {
        sed -i "$1s/.*/$2/" $3
    }

    _testNotify() {
        if [[ -e $(which notify-send) ]]; then
            killall -q dunst
            notify-send -u low "Head Low" "Body Low"
            notify-send -u normal "Head Normal" "Body Normal"
            notify-send -u critical "Head Critical" "Body Critical"
        fi
    }

    _setNord() {
        # Changes Terminator Theme
        _replaceline 2454 "      profile = Nord" $HOME/.dotfiles/terminals/terminator/config

        # Changes DunstRC Config
        rm -v $HOME/.config/dunst/dunstrc
        ln -v -sf $HOME/.dotfiles/environment/dunst/Nord $HOME/.config/dunst/dunstrc
        printf "%s\n" "Testing Notification"
        _testNotify

        # Change Firefox chrome colors & startpage default theme
        rm -v $HOME/.dotfiles/environment/firefox/stylesheets/chrome/Theme
        ln -v -sf $HOME/.dotfiles/environment/firefox/stylesheets/Themes/Nord $HOME/.dotfiles/environment/firefox/stylesheets/chrome/Theme
        _replaceline 10 '        <link rel="stylesheet" type="text\/css" id="CSSSwitcher" href=".\/CSS\/ColorsStyles\/NordStyle.css">' $HOME/.dotfiles/environment/firefox/startpages/Chill/index.html

        # Change Polybar
        rm -v $HOME/.dotfiles/environment/polybar/config.ini
        ln -v -sf $HOME/.dotfiles/environment/polybar/Themes/Nord.ini $HOME/.dotfiles/environment/polybar/config.ini

        # Change Rofi Themes
        _replaceline 7 '@theme "\/usr\/share\/rofi\/themes\/Nord.rasi"' $HOME/.dotfiles/environment/rofi/config.rasi
        _replaceline 22 '@import "NordTheme.rasi"' $HOME/.dotfiles/environment/rofi/applets/styles/colors.rasi

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

    _setMaterialOcean() {
        # Changes Terminator Theme
        _replaceline 2454 "      profile = Material Theme Ocean" $HOME/.dotfiles/terminals/terminator/config

        # Changes DunstRC Config
        rm -v $HOME/.config/dunst/dunstrc
        ln -v -sf $HOME/.dotfiles/environment/dunst/MaterialOcean $HOME/.config/dunst/dunstrc
        printf "%s\n" "Testing Notification"
        _testNotify

        # Change Firefox chrome colors & startpage default theme
        rm -v $HOME/.dotfiles/environment/firefox/stylesheets/chrome/Theme
        ln -v -sf $HOME/.dotfiles/environment/firefox/stylesheets/Themes/MaterialOcean $HOME/.dotfiles/environment/firefox/stylesheets/chrome/Theme
        _replaceline 10 '        <link rel="stylesheet" type="text\/css" id="CSSSwitcher" href=".\/CSS\/ColorsStyles\/MaterialOceanStyle.css">' $HOME/.dotfiles/environment/firefox/startpages/Chill/index.html

        # Change Polybar
        rm -v $HOME/.dotfiles/environment/polybar/config.ini
        ln -v -sf $HOME/.dotfiles/environment/polybar/Themes/MaterialOcean.ini $HOME/.dotfiles/environment/polybar/config.ini

        # Change Rofi Themes
        _replaceline 7 '@theme "\/usr\/share\/rofi\/themes\/MaterialOcean.rasi"' $HOME/.dotfiles/environment/rofi/config.rasi
        _replaceline 22 '@import "MaterialOceanTheme.rasi"' $HOME/.dotfiles/environment/rofi/applets/styles/colors.rasi

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

    _setDracula() {
        # Changes Terminator Theme
        _replaceline 2454 "      profile = Dracula" $HOME/.dotfiles/terminals/terminator/config

        # Changes DunstRC Config
        rm -v $HOME/.config/dunst/dunstrc
        ln -v -sf $HOME/.dotfiles/environment/dunst/Dracula $HOME/.config/dunst/dunstrc
        printf "%s\n" "Testing Notification"
        _testNotify

        # Change Firefox chrome colors & startpage default theme
        rm -v $HOME/.dotfiles/environment/firefox/stylesheets/chrome/Theme
        ln -v -sf $HOME/.dotfiles/environment/firefox/stylesheets/Themes/Dracula $HOME/.dotfiles/environment/firefox/stylesheets/chrome/Theme
        _replaceline 10 '        <link rel="stylesheet" type="text\/css" id="CSSSwitcher" href=".\/CSS\/ColorsStyles\/DraculaStyle.css">' $HOME/.dotfiles/environment/firefox/startpages/Chill/index.html

        # Change Polybar
        rm -v $HOME/.dotfiles/environment/polybar/config.ini
        ln -v -sf $HOME/.dotfiles/environment/polybar/Themes/Dracula.ini $HOME/.dotfiles/environment/polybar/config.ini

        # Change Rofi Themes
        _replaceline 7 '@theme "\/usr\/share\/rofi\/themes\/Dracula.rasi"' $HOME/.dotfiles/environment/rofi/config.rasi
        _replaceline 22 '@import "DraculaTheme.rasi"' $HOME/.dotfiles/environment/rofi/applets/styles/colors.rasi

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
            _setMaterialOcean
        ;;
        "2" | 2)
            _setNord
        ;;
        "3" | 3)
            _setDracula
        ;;
        "0" | 0)
            exit
        ;;
        *)
        printf "Invalid input, try again\n"
        ;;
    esac
}

### - Install Functions
###   - Environment Install Functions
instI3wm() {
    if [[ -e $(which i3) ]]; then
        printf "Installing i3WM\n"
        if [[ -d $HOME/.config/i3 ]]; then
            printf "%s\n" "i3 config found, creating backup in $BACKUPFOLDER/"
            mkbkp $BACKUPFOLDER/i3wm $HOME/.config/i3
            rmdir -v $HOME/.config/i3
            ln -v -sf $HOME/.dotfiles/environment/i3wm $HOME/.config/i3
        else
            rmdir -v $HOME/.config/i3
            ln -v -sf $HOME/.dotfiles/environment/i3wm $HOME/.config/i3
        fi
    fi
}

instPoly() {
    if [[ -e $(which polybar) ]]; then
        printf "Installing Polybar\n"
        if [[ -e $HOME/.config/polybar ]]; then
            printf "%s\n" "polybar config found, creating backup in $BACKUPFOLDER/"
            mkbkp $BACKUPFOLDER/polybar $HOME/.config/polybar
            rmdir -v $HOME/.config/polybar
            ln -v -sf $HOME/.dotfiles/environment/polybar $HOME/.config/
        else
            rmdir -v $HOME/.config/polybar
            ln -v -sf $HOME/.dotfiles/environment/polybar $HOME/.config/
        fi
    fi
}

instDunst() {
    if [[ -e $(which dunst) ]]; then
        printf "Installing Dunst\n"
        printf "You will be prompted to select a Rice theme in the end of the script.\n"
    fi
}

instPicom() {
    if [[ -e $(which picom) ]]; then
        printf "Installing Picom\n"
        if [[ -d $HOME/.config/picom ]]; then
            printf "%s\n" "picom config found, creating backup in $BACKUPFOLDER/"
            mkbkp $BACKUPFOLDER/picom $HOME/.config/picom
            rmdir -v $HOME/.config/picom
            ln -v -sf $HOME/.dotfiles/environment/picom $HOME/.config/
        else
            rmdir -v $HOME/.config/picom
            ln -v -sf $HOME/.dotfiles/environment/picom $HOME/.config/
        fi
    fi
}

instRofi() {
    if [[ -e $(which rofi) ]]; then
        printf "Installing Rofi\n"
        if [[ -d /usr/share/rofi/themes ]];
            printf "%s\n" "the rofi themes resides in the ${DARK_YELLOW}/usr${NOCOLOR} folder, to install these themes we will need the sudo permission"
            sudo rmdir -v /usr/share/rofi/themes
            sudo ln -v -sf $HOME/.dotfiles/environment/rofi/themes /usr/share/rofi/
        else
            sudo ln -v -sf $HOME/.dotfiles/environment/rofi/themes /usr/share/rofi/
        fi

        if [[ -d $HOME/.config/rofi ]]; then
            printf "Installing Rofi Applets Config\n"
            rm -rf $HOME/.config/rofi/*
            ln -v -sf $HOME/.dotfiles/environment/rofi/applets $HOME/.config/rofi/
            ln -v -sf $HOME/.dotfiles/environment/rofi/bin $HOME/.config/rofi/
            ln -v -sf $HOME/.dotfiles/environment/rofi/launchers $HOME/.config/rofi/
            ln -v -sf $HOME/.dotfiles/environment/rofi/powermenu $HOME/.config/rofi/
            ln -v -sf $HOME/.dotfiles/environment/rofi/config.rasi $HOME/.config/rofi/
        fi
    fi
}

instSDDM() {
    if [[ -e $(which sddm) ]]; then
        if [[ -d /usr/share/sddm/themes/Sugar-Candy ]]; then
            printf "${DARK_GREEN}Installing${NOCOLOR} SDDM Sugar Candy Theme Config\n"
            sudo mv -v $HOME/.dotfiles/environment/sddm/Themes/Wallpapers/* /usr/share/sddm/themes/Sugar-Candy/Backgrounds/
            sudo ln -v -sf /usr/share/sddm/themes/Sugar-Candy/* $HOME/.dotfiles/environment/sddm/Themes/SugarCandy/
            sudo mkdir -v /etc/sddm.conf.d
            sudo ln -v -sf $HOME/.dotfiles/environment/sddm/config.conf /etc/sddm.conf.d/
            printf "In the end of the script you will be prompted to select the Rice theme, including SDDM theme\n"
        else
            printf "%s\n" "Install the Sugar Candy Theme ${DARK_BLUE} (https://github.com/Kangie/sddm-sugar-candy)${NOCOLOR}"
            printf "%s\n" "And run the following commands"
            printf "%s\n" "${DARK_YELLOW}sudo mv -v \$HOME/.dotfiles/environment/sddm/Themes/Wallpapers/* /usr/share/sddm/themes/Sugar-Candy/Backgrounds/${NOCOLOR}"
            printf "%s\n" "${DARK_YELLOW}sudo ln -v -sf /usr/share/sddm/themes/Sugar-Candy/* \$HOME/.dotfiles/environment/sddm/Themes/SugarCandy/${NOCOLOR}"
            printf "%s\n" "${DARK_YELLOW}sudo mkdir -v /etc/sddm.conf.d${NOCOLOR}"
            printf "%s\n" "${DARK_YELLOW}sudo ln -v -sf \$HOME/.dotfiles/environment/sddm/config.conf /etc/sddm.conf.d/${NOCOLOR}"
        fi
    fi
}

###   - Shells Install Functions
instShells(){
    _instBASH() {
        printf "Installing BASH Configs\n"
        if [[ -d $HOME/.bash ]]; then
            mkbkp $BACKUPFOLDER/bash $HOME/.bash
            rm -v -rf $HOME/.bash/*
            rm -v $HOME/.bashrc
            for lnk in $(find $HOME/.dotfiles/shells/bash -type l -print); do
                unlink $lnk
            done
            for itn in $HOME/.dotfiles/shells/shcommons/*; do
                ln -v -sf $itn $HOME/.dotfiles/shells/bash
            done
            for itn in $HOME/.dotfiles/shells/bash/*; do
                ln -v -sf $itn $HOME/.bash/
            done
            rm -v $HOME/.bash/.bashrc
            ln -v -sf $HOME/.bash/.bashrc $HOME/.bashrc
        else
            mkdir $HOME/.bash
            for lnk in $(find $HOME/.dotfiles/shells/bash -type l -print); do
                unlink $lnk
            done
            for itn in $HOME/.dotfiles/shells/shcommons/*; do
                ln -v -sf $itn $HOME/.dotfiles/shells/bash
            done
            for itn in $HOME/.dotfiles/shells/bash/*; do
                ln -v -sf $itn $HOME/.bash/
            done
            rm -v $HOME/.bash/.bashrc
            ln -v -sf $HOME/.bash/.bashrc $HOME/.bashrc
        fi
    }

    _instZSH() {
        printf "Installing ZSH Configs\n"
        if [[ -d $HOME/.zsh ]]; then
            mkbkp $BACKUPFOLDER/zsh $HOME/.zsh
            rm -v -rf $HOME/.zsh/*
            rm -v $HOME/.zshrc
            rm -v $HOME/.zshenv
            for lnk in $(find $HOME/.dotfiles/shells/zsh -type l -print); do
                unlink $lnk
            done
            for itn in $HOME/.dotfiles/shells/shcommons/*; do
                ln -v -sf $itn $HOME/.dotfiles/shells/zsh
            done
            for itn in $HOME/.dotfiles/shells/zsh/*; do
                ln -v -sf $itn $HOME/.zsh/
            done
            rm -v $HOME/.zsh/.zshrc
            rm -v $HOME/.zsh/.zshenv
            ln -v -sf $HOME/.zsh/.zshrc $HOME/.zshrc
            ln -v -sf $HOME/.zsh/.zshenv $HOME/.zshenv
        else
            mkdir $HOME/.zsh
            for lnk in $(find $HOME/.dotfiles/shells/zsh -type l -print); do
                unlink $lnk
            done
            for itn in $HOME/.dotfiles/shells/shcommons/*; do
                ln -v -sf $itn $HOME/.dotfiles/shells/zsh
            done
            for itn in $HOME/.dotfiles/shells/zsh/*; do
                ln -v -sf $itn $HOME/.zsh/
            done
            rm -v $HOME/.zsh/.zshrc
            rm -v $HOME/.zsh/.zshenv
            ln -v -sf $HOME/.zsh/.zshrc $HOME/.zshrc
            ln -v -sf $HOME/.zsh/.zshenv $HOME/.zshenv
        fi
    }

    printf "Installing Shell Configs\n"
    printf "Trying to automatic detect shell\n"
    if [[ ${SHELL##*/} == "zsh" ]]; then
        printf "ZSH found as default shell\n"
        _instZSH

        echo -e -n "Do you want to install BASH Configs (${DARK_GREEN}y${NOCOLOR}/${DARK_RED}n${NOCOLOR})? "
        old_stty_cfg=$(stty -g)
        stty raw -echo
        answer=$( while ! head -c 1 | grep -i '[ny]' ;do true ;done )
        stty $old_stty_cfg
        if echo "$answer" | grep -iq "^y" ;then
            printf "${DARK_GREEN}Installing${TEXTRESETALL}\n"
            _instBASH
        else
            printf "${DARK_RED}Proceeding${TEXTRESETALL}\n"
        fi
    elif [[ ${SHELL##*/} == "bash" ]]; then
        printf "BASH found as default shell\n"
        _instBASH

        echo -e -n "Do you want to install ZSH Configs (${DARK_GREEN}y${NOCOLOR}/${DARK_RED}n${NOCOLOR})? "
        old_stty_cfg=$(stty -g)
        stty raw -echo
        answer=$( while ! head -c 1 | grep -i '[ny]' ;do true ;done )
        stty $old_stty_cfg
        if echo "$answer" | grep -iq "^y" ;then
            printf "${DARK_GREEN}Installing${TEXTRESETALL}\n"
            _instZSH
        else
            printf "${DARK_RED}Proceeding${TEXTRESETALL}\n"
        fi
    else
        printf "Detection Failed, Proceeding with manual detection\n"
        printf "What do you want to install?\n"
        printf "1. BASH Configs\n"
        printf "2. ZSH Configs\n"
        printf "3. BASH & ZSH Configs\n"
        printf "0. Abort\n"
        read -e -p "Select a number: " SHLINST
        case $SHLINST in
            "1" | 1)
                if [[ -e $(which bash) ]]; then
                    _instBASH
                fi
            ;;
            "2" | 2)
                if [[ -e $(which zsh) ]]; then
                    _instZSH
                fi
            ;;
            "3" | 3)
                if [[ -e $(which bash) ]]; then
                    _instBASH
                fi
                if [[ -e $(which zsh) ]]; then
                    _instZSH
                fi
            ;;
            "0" | 0)
                printf "${DARK_RED}Aborting${TEXTRESETALL}\n"
            ;;
            *)
            printf "Invalid input, try again\n"
            ;;
        esac
    fi
}

###   - Terminals Install Functions
instCRT() {
    if [[ -e $(which cool-retro-term) ]]; then
        printf "Installing Cool Retro Term\n"
        if [[ -e /usr/lib/qt/qml/QMLTermWidget/color-schemes/cool-retro-term.colorscheme ]]; then
            sudo rm /usr/lib/qt/qml/QMLTermWidget/color-schemes/cool-retro-term.colorscheme
            printf "Please select one of these themes:\n"
            printf "%s\n" "0. Default"
            printf "%s\n" "1. Dracula"
            printf "%s\n" "2. MaterialOcean"
            printf "%s\n" "3. Nord"
            read -e -p "Enter the number: " CHOICE
            case $CHOICE in
            "0" | 0)
            sudo ln -v -sf $HOME/.dotfiles/terminals/cool-retro-term/Themes/default.colorscheme /usr/lib/qt/qml/QMLTermWidget/color-schemes/cool-retro-term.colorscheme
            ;;
            "1" | 1)
            sudo ln -v -sf $HOME/.dotfiles/terminals/cool-retro-term/Themes/Dracula.colorscheme /usr/lib/qt/qml/QMLTermWidget/color-schemes/cool-retro-term.colorscheme
            ;;
            "2" | 2)
            sudo ln -v -sf $HOME/.dotfiles/terminals/cool-retro-term/Themes/MaterialThemeOcean.colorscheme /usr/lib/qt/qml/QMLTermWidget/color-schemes/cool-retro-term.colorscheme
            ;;
            "3" | 3)
            sudo ln -v -sf $HOME/.dotfiles/terminals/cool-retro-term/Themes/Nord.colorscheme /usr/lib/qt/qml/QMLTermWidget/color-schemes/cool-retro-term.colorscheme
            ;;
            *)
            printf "Invalid input, try again\n"
            ;;
            esac
        fi
        printf "%s\n" "If you want another theme, run the changeTheme script in ${DARK_YELLOW}$HOME/.dotfiles/terminals/cool-retro-term/${NOCOLOR}"
        printf "%s\n" "Or if you want you can read the readme.md in ${DARK_YELLOW}$HOME/.dotfiles/terminals/cool-retro-term/${NOCOLOR} or in ${DARK_BLUE}https://github.com/MiraiMindz/.dotfiles/tree/main/terminals/cool-retro-term#readme${NOCOLOR}"
    fi
}

instTerminator() {
    if [[ -e $(which terminator) ]]; then
        printf "Installing Terminator\n"
        if [[ -d $HOME/.config/terminator ]]; then
            printf "%s\n" "terminator config found, creating backup in $BACKUPFOLDER/"
            mkbkp $BACKUPFOLDER/terminator $HOME/.config/terminator
            rmdir -v $HOME/.config/terminator
            ln -v -sf $HOME/.dotfiles/environment/terminator $HOME/.config/
        else
            rmdir -v $HOME/.config/terminator
            ln -v -sf $HOME/.dotfiles/environment/terminator $HOME/.config/
        fi
    fi
}

###   - Editors Install Functions
instVI() {
    if [[ -e $(which vi) ]]; then
        printf "Installing VI\n"
        if [[ -e $HOME/.exrc ]]; then
            mkdir -v $BACKUPFOLDER/vi
            mv -v $HOME/.exrc $BACKUPFOLDER/vi/
            ln -v -sf $HOME/.dotfiles/editors/vi/.exrc $HOME/
        else
            ln -v -sf $HOME/.dotfiles/editors/vi/.exrc $HOME/
        fi
    fi
}

instVIM() {
    if [[ -e $(which vim) ]]; then
        printf "Installing VIM\n"
        printf "Clearing VIM/NVIM Commons symlinks in .dotfiles\n"
        for lnk in $(find $HOME/.dotfiles/editors/vim/vimfiles -type l -print); do
            unlink $lnk
        done
        if [[ -d $HOME/.vim ]]; then
            printf ".Vim folder found.\n"
            mkdir -v $BACKUPFOLDER/vim
            mkbkp $BACKUPFOLDER/vim/vim $HOME/.vim
        fi
        if [[ -d $HOME/vimfiles ]]; then
            printf "Vim files folder found.\n"
            mkbkp $BACKUPFOLDER/vim/vimfiles $HOME/vimfiles
        fi
        if [[ -e $HOME/.vimrc ]]; then
            printf ".VimRC found.\n"
            mv -v $HOME/.vimrc $BACKUPFOLDER/vim/
        fi
        rm -v -rf $HOME/vimfiles
        rm -v -rf $HOME/.vim
        for itn in $HOME/.dotfiles/editors/vim-nvim-commons/configs/*; do
            ln -v -sf $itn $HOME/.dotfiles/editors/vim/vimfiles
        done
        ln -v -sf $HOME/.dotfiles/editors/vim-nvim-commons/plugins $HOME/.dotfiles/editors/vim/.vim/
        ln -v -sf $HOME/.dotfiles/editors/vim/.vim $HOME/
        ln -v -sf $HOME/.dotfiles/editors/vim/vimfiles $HOME/
        ln -v -sf $HOME/.dotfiles/editors/vim/.vimrc $HOME/
    fi
}

instNVIM() {
    if [[ -e $(which nvim) ]]; then
        printf "Installing NVIM\n"
        printf "Clearing VIM/NVIM Commons symlinks in .dotfiles\n"
        for lnk in $(find $HOME/.dotfiles/editors/nvim/nvimfiles -type l -print); do
            unlink $lnk
        done
        for lnk in $(find $HOME/.dotfiles/editors/nvim -type l -print); do
            unlink $lnk
        done
        if [[ -d $HOME/.config/nvim ]]; then
            printf "NeoVim Config folder found.\n"
            mkbkp $BACKUPFOLDER/nvim/ $HOME/.config/nvim
        fi
        for itn in $HOME/.dotfiles/editors/vim-nvim-commons/configs/*; do
            ln -v -sf $itn $HOME/.dotfiles/editors/nvim/nvimfiles
        done
        rm -v -rf $HOME/.config/nvim
        ln -v -sf $HOME/.dotfiles/editors/vim-nvim-commons/plugins $HOME/.dotfiles/editors/nvim/
        ln -v -sf $HOME/.dotfiles/editors/nvim $HOME/.config/
    fi
}

###   - Apps Install Functions
instFirefox() {
    if [[ -e $(which firefox) ]]; then
        if [[ -d $HOME/.mozilla/firefox ]]; then
            printf "Installing Firefox Configs & Startpage\n"
            for d in $HOME/.mozilla/firefox/*/ ; do
                filename=$(basename -- "$d")
                extension="${filename##*.}"
                if [[ "$extension" = "default-release" ]]; then
                    filteredname=$(basename -- "$d")
                fi
            done
            fullprofilepath="$HOME/.mozilla/firefox/$filteredname"
            printf "Found UserProfile under: $fullprofilepath\n"

            ln -v -sf $HOME/.dotfiles/environment/firefox/chrome $HOME/.mozilla/firefox/$filteredname/
            ln -v -sf $HOME/.dotfiles/environment/firefox/startpage $HOME/.mozilla/firefox/$filteredname/

            echo "Creating mozilla.cfg file"
            touch ./mozilla.cfg
            echo "//" >> ./mozilla.cfg
            echo "var {classes:Cc,interfaces:Ci,utils:Cu} = Components;" >> ./mozilla.cfg
            echo "/* set new tab page */" >> ./mozilla.cfg
            echo "try {" >> ./mozilla.cfg
            echo "  Cu.import("resource:///modules/AboutNewTab.jsm");" >> ./mozilla.cfg
            echo "  var newTabURL = "file://$HOME/.mozilla/firefox/$filteredname/startpage/index.html";" >> ./mozilla.cfg
            echo "  AboutNewTab.newTabURL = newTabURL;" >> ./mozilla.cfg
            echo "} catch(e){Cu.reportError(e);} // report errors in the Browser Console" >> ./mozilla.cfg

            sudo mv -v ./mozilla.cfg /usr/lib/firefox/

            printf "Creating local-settings.js file\n"
            touch ./local-settings.js
            echo "//" >> ./local-settings.js
            echo "pref(\"general.config.filename\", \"mozilla.cfg\");" >> ./local-settings.js
            echo "pref(\"general.config.obscure_value\", 0);" >> ./local-settings.js
            echo "pref(\"general.config.sandbox_enabled\", false);" >> ./local-settings.js

            sudo mv -v ./local-settings.js /usr/lib/firefox/defaults/pref/

            cat $HOME/.dotfiles/environment/firefox/ff-prefs.js >> "$fullprofilepath/prefs.js"
            printf "Change your home page in 'about:preferences#home' to 'file://$HOME/.mozilla/firefox/$filteredname/startpage/index.html'\n"
            printf "Restart Firefox\n"
        fi
    fi
}

instLSD() {
    if [[ -e $(which lsd) ]]; then
        printf "Installing LSD Configs\n"
        if [[ -d $HOME/.config/lsd ]]; then
            mkbkp $BACKUPFOLDER/lsd $HOME/.config/lsd
            rm -v -rf $HOME/.config/lsd/*
            ln -v -sf $HOME/.dotfiles/lsd/* $HOME/.config/lsd/
        else
            mkdir -v $HOME/.config/lsd
            ln -v -sf $HOME/.dotfiles/lsd/* $HOME/.config/lsd/
        fi
    fi
}

instNeofetch() {
    if [[ -e $(which neofetch) ]]; then
        printf "Installing Neofetch Configs\n"
        if [[ -d $HOME/.config/neofetch ]]; then
            printf "neofetch config found, creating backup in $BACKUPFOLDER\n"
            mkbkp $BACKUPFOLDER/neofetch $HOME/.config/neofetch
            rmdir -v $HOME/.config/neofetch
            ln -v -sf $HOME/.dotfiles/neofetch $HOME/.config/
        else
            rmdir -v $HOME/.config/neofetch
            ln -v -sf $HOME/.config/neofetch $HOME/.config/
        fi
    fi
}

instCustomExecs() {
    printf "Installing Custom Executables\n"
    if [[ -e $(which wine) ]]; then
        if [[ -e "$HOME/.wine/drive_c/Program Files/Image-Line/FL Studio 20/FL64.exe" ]]; then
            printf "Installing FL Studio Custom Executable\n"
            ln -v -sf $HOME/.dotfiles/environment/custom_execs/flstudio.sh /usr/bin/
        fi
    fi

    printf "Installing Sysman Custom Executable\n"
    ln -v -sf $HOME/.dotfiles/environment/custom_execs/sysman.sh /usr/bin/
}

### - Final Function
doinstall() {
    printf "Checking packages please wait.\n"
    checkPackages

    printf "Installing .dotfiles Configs\n"
    createDotfiles_BackupDir

    printf "Installing Environment Configs\n"
    instI3wm
    instPoly
    instDunst
    instPicom
    instRofi
    instSDDM

    printf "Installing Shells Configs\n"
    instShells

    printf "Installing Terminals Configs\n"
    instTerminator
    instCRT

    printf "Installing Editors Configs\n"
    instVI
    instVIM
    instNVIM

    printf "Installing Apps Configs\n"
    instFirefox
    instLSD
    instNeofetch
    instCustomExecs

    printf "Installation done.\n"

    echo -e -n "Do you want to create a Git repo (${DARK_GREEN}y${NOCOLOR}/${DARK_RED}n${NOCOLOR})? "
    old_stty_cfg=$(stty -g)
    stty raw -echo
    answer=$( while ! head -c 1 | grep -i '[ny]' ;do true ;done )
    stty $old_stty_cfg
    if echo "$answer" | grep -iq "^y" ;then
        printf "${DARK_GREEN}Creating${TEXTRESETALL}\n"
        initgit
    else
        printf "${DARK_RED}Aborting${TEXTRESETALL}\n"
    fi

    printf "Welcome to this rice theme changer.\n"
    changeRiceTheme
}

### Installation
printf "Welcome to Mirai's .dotfiles install script\n"
printf "This script will install the configs for the following packages:\n"
printf "${DARK_GREEN}BASH${DARK_BLUE} (https://github.com/gitGNU/gnu_bash)${NOCOLOR}\n"
printf "${DARK_GREEN}ZSH${DARK_BLUE} (https://github.com/zsh-users/zsh)${NOCOLOR}\n"
printf "${DARK_GREEN}Picom ${DARK_PURPLE}[Ibhagwan Fork]${DARK_BLUE}(https://github.com/ibhagwan/picom)${NOCOLOR}\n"
printf "${DARK_GREEN}i3wm${DARK_BLUE} (https://github.com/Airblader/i3)${NOCOLOR}\n"
printf "${DARK_GREEN}Firefox${DARK_BLUE} (https://hg.mozilla.org/mozilla-central/)${NOCOLOR}\n"
printf "${DARK_GREEN}Neofetch${DARK_BLUE} (https://github.com/dylanaraps/neofetch)${NOCOLOR}\n"
printf "${DARK_GREEN}Polybar${DARK_BLUE} (https://github.com/polybar/polybar)${NOCOLOR}\n"
printf "${DARK_GREEN}Rofi${DARK_BLUE} (https://github.com/davatorium/rofi)${NOCOLOR}\n"
printf "${DARK_GREEN}Rofi Applets${DARK_BLUE} (https://github.com/adi1090x/rofi)${NOCOLOR}\n"
printf "${DARK_GREEN}Terminator${DARK_BLUE} (https://github.com/gnome-terminator/terminator)${NOCOLOR}\n"
printf "${DARK_GREEN}Cool Retro Term${DARK_BLUE} (https://github.com/Swordfish90/cool-retro-term)${NOCOLOR}\n"
printf "${DARK_GREEN}Vi${DARK_BLUE} (https://sourceforge.net/projects/ex-vi/)${NOCOLOR}\n"
printf "${DARK_GREEN}Vim${DARK_BLUE} (https://github.com/vim/vim)${NOCOLOR}\n"
printf "${DARK_GREEN}NeoVim${DARK_BLUE} ((https://github.com/neovim/neovim)${NOCOLOR}\n"
printf "${DARK_GREEN}SDDM ${DARK_BLUE}(https://github.com/sddm/sddm)${NOCOLOR}\n"
printf "${DARK_GREEN}SDDM Sugar Candy${DARK_BLUE} (https://github.com/Kangie/sddm-sugar-candy)${NOCOLOR}\n"

printf "${DARK_YELLOW}This script will create a folder inside the ${DARK_CYAN}\$HOME ${DARK_BLUE}($HOME)${DARK_YELLOW} directiory called ${DARK_CYAN}.dotfiles${DARK_YELLOW} and then will create symlinks from that directory to the original config files.\n"
printf "If any configuration is found it will be backed up in this folder ${DARK_BLUE}($BACKUPFOLDER/)${TEXTRESETALL}\n\n"

echo -e -n "Do you have these packages installed (${DARK_GREEN}y${NOCOLOR}/${DARK_RED}n${NOCOLOR})? "
old_stty_cfg=$(stty -g)
stty raw -echo
answer=$( while ! head -c 1 | grep -i '[ny]' ;do true ;done )
stty $old_stty_cfg
if echo "$answer" | grep -iq "^y" ;then
    printf "${DARK_GREEN}Installing${TEXTRESETALL}\n"
    doinstall
else
    printf "${DARK_RED}Aborting${TEXTRESETALL}\n"
fi
