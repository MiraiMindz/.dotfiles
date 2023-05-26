#!/usr/bin/env bash

# 16 Colors Foreground
DARK_BLACK_16_fg='\e[30m'
DARK_RED_16_fg='\e[31m'
DARK_GREEN_16_fg='\e[32m'
DARK_YELLOW_16_fg='\e[33m'
DARK_BLUE_16_fg='\e[34m'
DARK_PURPLE_16_fg='\e[35m'
DARK_CYAN_16_fg='\e[36m'
DARK_WHITE_16_fg='\e[37m'
LIGHT_BLACK_16_fg='\e[90m'
LIGHT_RED_16_fg='\e[91m'
LIGHT_GREEN_16_fg='\e[92m'
LIGHT_YELLOW_16_fg='\e[93m'
LIGHT_BLUE_16_fg='\e[94m'
LIGHT_PURPLE_16_fg='\e[95m'
LIGHT_CYAN_16_fg='\e[96m'
LIGHT_WHITE_16_fg='\e[97m'
NOCOLOR_16_fg='\e[39m'

# 16 Colors Background
DARK_BLACK_16_bg='\e[40m'
DARK_RED_16_bg='\e[41m'
DARK_GREEN_16_bg='\e[42m'
DARK_YELLOW_16_bg='\e[43m'
DARK_BLUE_16_bg='\e[44m'
DARK_PURPLE_16_bg='\e[45m'
DARK_CYAN_16_bg='\e[46m'
DARK_WHITE_16_bg='\e[47m'
LIGHT_BLACK_16_bg='\e[100m'
LIGHT_RED_16_bg='\e[101m'
LIGHT_GREEN_16_bg='\e[102m'
LIGHT_YELLOW_16_bg='\e[103m'
LIGHT_BLUE_16_bg='\e[104m'
LIGHT_PURPLE_16_bg='\e[105m'
LIGHT_CYAN_bg='\e[106m'
LIGHT_WHITE_16_bg='\e[107m'
NOCOLOR_16_bg='\e[49m'

poptions() {
    printf "%s\n" "Options:"
    printf "${DARK_BLUE_16_fg}1${NOCOLOR_16_fg}. Update/Refresh Pacman Mirrors\n"
    printf "${DARK_BLUE_16_fg}2${NOCOLOR_16_fg}. Update System\n"
    printf "${DARK_BLUE_16_fg}3${NOCOLOR_16_fg}. Refresh the Database\n"
    printf "${DARK_BLUE_16_fg}4${NOCOLOR_16_fg}. Update Programming Languages Packages\n"
    printf "${DARK_BLUE_16_fg}5${NOCOLOR_16_fg}. Clear Programming Languages Cache\n"
    printf "${DARK_BLUE_16_fg}6${NOCOLOR_16_fg}. Clear Cache\n"
    printf "${DARK_BLUE_16_fg}7${NOCOLOR_16_fg}. Clear Unused/Orphans Packages\n"
    printf "${DARK_BLUE_16_fg}8${NOCOLOR_16_fg}. Clear Lost Files\n"
    printf "${DARK_BLUE_16_fg}9${NOCOLOR_16_fg}. List Packages (Date/Size)\n"
    printf "${DARK_BLUE_16_fg}10${NOCOLOR_16_fg}. Clear The System\n"
    printf "${DARK_BLUE_16_fg}0${NOCOLOR_16_fg}. Exit\n"
}

upmirrors() {
    if [[ $(id -u ) -ne 0 ]]; then
        printf "%s\n" "Please run as sudo"
    else
        if [[ -e /etc/pacman.d/mirrorlist ]]; then
            rm /etc/pacman.d/mirrorlist
            while IFS="" read -r p || [ -n "$p" ]; do
                printf "%s\n" "${p##\#}" >> /etc/pacman.d/mirrorlist
            done <<< $(curl https://archlinux.org/mirrorlist/all/)
        else
            while IFS="" read -r p || [ -n "$p" ]; do
                printf "%s\n" "${p##\#}" >> /etc/pacman.d/mirrorlist
            done <<< $(curl https://archlinux.org/mirrorlist/all/)
        fi
    fi
}

refreshdatabase() {
    printf "%s\n" "Refreshing the database"
    if [[ -e $(which yay) ]]; then
        sudo sh -c "pacman -Fy"
        printf "%s\n" "AUR Helper (yay) found, refreshing it's database as well"
        yay -Fy
    else
        sudo sh -c "pacman -Fy"
    fi
}

upLangsPkgs() {
    if [[ -e $(which go) ]]; then
        printf "%s\n" "Updating GoLang Packages"
        go get -u all
    fi
    if [[ -e $(which node) ]]; then
        printf "%s\n" "Updating NodeJS Packages"
        npm update
    fi
    if [[ -e $(which pip) ]]; then
        printf "%s\n" "Updating Pip Packages"
        pip list --outdated --format=freeze | grep -v '^\-e' | cut -d = -f 1  | xargs -n1 pip install -U
    fi
    if [[ -e $(which dart) ]]; then
        if [[ -e $(which flutter) ]]; then
            printf "%s\n" "Updating Flutter"
            flutter upgrade
        fi
    fi
}

clearLangsCache() {
    if [[ -e $(which go) ]]; then
        printf "%s\n" "Clearing GoLang Cache"
        go clean -i -r
    fi
    if [[ -e $(which node) ]]; then
        printf "%s\n" "Clearing NodeJS Cache"
        #npm cache clean
        npm cache verify
        local _EXTSTS=$?
    fi
    if [[ -e $(which pip) ]]; then
        printf "%s\n" "Clearing Pip Cache"
        rm -rfv "$(pip cache dir)/*"
    fi
    if [[ -e $(which dart) ]]; then
        if [[ -e $(which flutter) ]]; then
            printf "%s\n" "Clearing Dart/Flutter Cache"
            flutter clean
        fi
    fi
    if [[ -e $(which java) ]]; then
        printf "%s\n" "Clearing Java Cache"
        javaws -clearcache
        javaws -uninstall
    fi
}

clearcache() {
    printf "%s\n" "This will clear the pacman cache and the user home cache"
    printf "%s\n" "clearing pacman cache"
    if [[ -e $(which paccache) ]]; then
        printf "%s\n" "paccache found"
        echo -e -n "Do you wish to ${DARK_BLUE_16_fg}p${NOCOLOR_16_fg}urge all the files in pacman cache or ${DARK_PURPLE_16_fg}k${NOCOLOR_16_fg}eep only the last version (${DARK_BLUE_16_fg}p${NOCOLOR_16_fg}/${DARK_PURPLE_16_fg}k${NOCOLOR_16_fg})? "
        old_stty_cfg=$(stty -g)
        stty raw -echo
        answer=$( while ! head -c 1 | grep -i '[kp]' ;do true ;done )
        stty $old_stty_cfg
        if echo "$answer" | grep -iq "^p" ;then
            printf "${DARK_RED_16_fg}Purging cache${NOCOLOR_16_fg}\n"
            sudo sh -c "pacman -Scc"
        else
            printf "${DARK_RED_16_fg}Keeping last version${NOCOLOR_16_fg}\n"
            paccache -rk1
        fi
    else
        echo -e -n "Do you wish to purge all files in pacman cache (${DARK_GREEN_16_fg}y${NOCOLOR_16_fg}/${DARK_RED_16_fg}n${NOCOLOR_16_fg})? "
        old_stty_cfg=$(stty -g)
        stty raw -echo
        answer=$( while ! head -c 1 | grep -i '[ny]' ;do true ;done )
        stty $old_stty_cfg
        if echo "$answer" | grep -iq "^y" ;then
            printf "${DARK_GREEN_16_fg}Removing Packages${NOCOLOR_16_fg}\n"
            sudo sh -c "pacman -Scc"
        else
            printf "%s\n" "passing"
        fi
    fi
    printf "%s\n" "clearing user home cache"
    rm -rf $HOME/.cache/*

    echo -e -n "Do you wish to clear Programming Languages Cache (${DARK_GREEN_16_fg}y${NOCOLOR_16_fg}/${DARK_RED_16_fg}n${NOCOLOR_16_fg})? "
    old_stty_cfg=$(stty -g)
    stty raw -echo
    answer=$( while ! head -c 1 | grep -i '[ny]' ;do true ;done )
    stty $old_stty_cfg
    if echo "$answer" | grep -iq "^y" ;then
        printf "%s\n" "Clearing programming languages cache"
        clearLangsCache
    else
        printf "%s\n" "passing"
    fi
}

upsys() {
    printf "%s\n" "Updating the system, the mirrors and refreshing the database"
    if [[ -e $(which yay) ]]; then
        sudo sh -c "$(declare -f upmirrors); upmirrors; pacman -Fy && pacman -Syu"
        printf "%s\n" "AUR Helper (yay) found, updating any AUR packages"
        yay -Syu
    else
        sudo sh -c "$(declare -f upmirrors); upmirrors; pacman -Fy && pacman -Syu"
    fi
    echo -e -n "Do you wish to update programming languages packages (${DARK_GREEN_16_fg}y${NOCOLOR_16_fg}/${DARK_RED_16_fg}n${NOCOLOR_16_fg})? "
    old_stty_cfg=$(stty -g)
    stty raw -echo
    answer=$( while ! head -c 1 | grep -i '[ny]' ;do true ;done )
    stty $old_stty_cfg
    if echo "$answer" | grep -iq "^y" ;then
        printf "%s\n" "Updating programming languages cache"
        upLangsPkgs
    else
        printf "%s\n" "passing"
    fi
}

clearPackages() {
    printf "%s\n" "Removing Unused/Ophans Packages"
    if [[ -e $(which yay) ]]; then
        printf "%s\n" "This will remove the following packages:"
        yay -Qtdq
        echo -e -n "Do you wish to proceed (${DARK_GREEN_16_fg}y${NOCOLOR_16_fg}/${DARK_RED_16_fg}n${NOCOLOR_16_fg})? "
        old_stty_cfg=$(stty -g)
        stty raw -echo
        answer=$( while ! head -c 1 | grep -i '[ny]' ;do true ;done )
        stty $old_stty_cfg
        if echo "$answer" | grep -iq "^y" ;then
            printf "${DARK_GREEN_16_fg}Removing Packages${NOCOLOR_16_fg}\n"
            yay -Qtdq | sudo yay -Rns -
        else
            printf "%s\n" "passing"
        fi
    else
        printf "%s\n" "This will remove the following packages:"
        sudo sh -c "pacman -Qtdq"
        echo -e -n "Do you wish to proceed (${DARK_GREEN_16_fg}y${NOCOLOR_16_fg}/${DARK_RED_16_fg}n${NOCOLOR_16_fg})? "
        old_stty_cfg=$(stty -g)
        stty raw -echo
        answer=$( while ! head -c 1 | grep -i '[ny]' ;do true ;done )
        stty $old_stty_cfg
        if echo "$answer" | grep -iq "^y" ;then
            printf "${DARK_GREEN_16_fg}Removing Packages${NOCOLOR_16_fg}\n"
            sudo sh -c "pacman -Qtdq | sudo pacman -Rns -"
        else
            printf "%s\n" "passing"
        fi
    fi
}

listPackagesDS() {
    listPackagesDate() {
        for i in $(pacman -Qq); do
            grep "\[ALPM\] installed $i" /var/log/pacman.log
        done | sort -u | sed -e 's/\[ALPM\] installed //' -e 's/(.*$//'
    }

    listPackagesSize() {
        LC_ALL=C pacman -Qi | awk '/^Name/{name=$3} /^Installed Size/{print $4$5, name}' | sort -h
    }

    printf "%s\n" "Listing Packages"
    printf "%s\n" "Options:"
    printf "${DARK_BLUE_16_fg}1${NOCOLOR_16_fg}. Date\n"
    printf "${DARK_BLUE_16_fg}2${NOCOLOR_16_fg}. Size\n"
    printf "${DARK_BLUE_16_fg}0${NOCOLOR_16_fg}. Go Back to Main Menu\n"
    printf "Select your option? "
    while :; do
        read OPT
        case $OPT in
            1)
                echo -e -n "Do you want to ${DARK_BLUE_16_fg}p${NOCOLOR_16_fg}rint or ${DARK_PURPLE_16_fg}s${NOCOLOR_16_fg}ave to file (${DARK_BLUE_16_fg}p${NOCOLOR_16_fg}/${DARK_PURPLE_16_fg}s${NOCOLOR_16_fg})? "
                old_stty_cfg=$(stty -g)
                stty raw -echo
                answer=$( while ! head -c 1 | grep -i '[sp]' ;do true ;done )
                stty $old_stty_cfg
                if echo "$answer" | grep -iq "^p" ;then
                    clear
                    printf "%s\n" "Printing"
                    listPackagesDate
                else
                    printf "%s\n" "Saving to $HOME/packagesDate_$(date +'%F')"
                    listPackagesDate > $HOME/packagesDate_$(date +'%F')
                    clear
                fi
            ;;
            2)
                echo -e -n "Do you want to ${DARK_BLUE_16_fg}p${NOCOLOR_16_fg}rint or ${DARK_PURPLE_16_fg}s${NOCOLOR_16_fg}ave to file (${DARK_BLUE_16_fg}p${NOCOLOR_16_fg}/${DARK_PURPLE_16_fg}s${NOCOLOR_16_fg})? "
                old_stty_cfg=$(stty -g)
                stty raw -echo
                answer=$( while ! head -c 1 | grep -i '[sp]' ;do true ;done )
                stty $old_stty_cfg
                if echo "$answer" | grep -iq "^p" ;then
                    clear
                    printf "%s\n" "Printing"
                    listPackagesSize
                else
                    printf "%s\n" "Saving to $HOME/packagesSize_$(date +'%F')"
                    listPackagesSize > $HOME/packagesSize_$(date +'%F')
                    clear
                fi
            ;;
            0)
                clear
                break
            ;;
            *)
                clear
                printf "%s\n" "Invalid Input"
            ;;
        esac
        printf "${DARK_BLUE_16_fg}1${NOCOLOR_16_fg}. Date\n"
        printf "${DARK_BLUE_16_fg}2${NOCOLOR_16_fg}. Size\n"
        printf "${DARK_BLUE_16_fg}0${NOCOLOR_16_fg}. Go Back to Main Menu\n"
        printf "Select your option? "
    done
}

clearLostFiles() {
    printf "%s\n" "clearing lost files (may take a long time to finish)"
    sudo find /etc /usr /opt | LC_ALL=C sudo pacman -Qqo - 2>&1 >&- >/dev/null | cut -d ' ' -f 5-
}

clearSystem() {
    printf "${DARK_GREEN_16_fg}Clearing the System${NOCOLOR_16_fg}\n"
    printf "%s\n" "This will do the folowing steps:"
    printf "${DARK_BLUE_16_fg}1${NOCOLOR_16_fg}. Purge Unused Packages\n"
    printf "${DARK_BLUE_16_fg}2${NOCOLOR_16_fg}. Clear the Pacman Cache\n"
    printf "${DARK_BLUE_16_fg}3${NOCOLOR_16_fg}. Clear the User Home Cache\n"
    printf "${DARK_BLUE_16_fg}4${NOCOLOR_16_fg}. Clear Lost Files (may take a long time to finish)\n"
    echo -e -n "Do you wish to proceed (${DARK_GREEN_16_fg}y${NOCOLOR_16_fg}/${DARK_RED_16_fg}n${NOCOLOR_16_fg})? "
    old_stty_cfg=$(stty -g)
    stty raw -echo
    answer=$( while ! head -c 1 | grep -i '[ny]' ;do true ;done )
    stty $old_stty_cfg
    if echo "$answer" | grep -iq "^y" ;then
        printf "${DARK_GREEN_16_fg}Clearing the Clutter${NOCOLOR_16_fg}\n"
        clearPackages
        clearcache
        echo -e -n "Do you wish to Clear Lost Files (may take a long time to finish) (${DARK_GREEN_16_fg}y${NOCOLOR_16_fg}/${DARK_RED_16_fg}n${NOCOLOR_16_fg})? "
        old_stty_cfg=$(stty -g)
        stty raw -echo
        answer=$( while ! head -c 1 | grep -i '[ny]' ;do true ;done )
        stty $old_stty_cfg
        if echo "$answer" | grep -iq "^y" ;then
            printf "${DARK_GREEN_16_fg}Clearing the Clutter${NOCOLOR_16_fg}\n"
            clearLostFiles
        else
            printf "%s\n" "passing"
        fi
    else
        printf "%s\n" "passing"
    fi
}


clear
printf "%s\n" "Welcome to the System Manager Function (SysMan)"
printf "%s\n" "This function exists to help you manage your ArchLinux System"
poptions
printf "What you want to do? "
while :; do
    read OPT
    case $OPT in
    1)
        clear
        printf "%s\n" "Updating mirrors from https://archlinux.org/mirrorlist/all/"
        sudo sh -c "$(declare -f upmirrors); upmirrors"
        printf "All the mirrors are ${DARK_GREEN_16_fg}UP TO DATE${NOCOLOR_16_fg}\n"
        echo -e -n "Do you wanna refresh the Database (${DARK_GREEN_16_fg}y${NOCOLOR_16_fg}/${DARK_RED_16_fg}n${NOCOLOR_16_fg})? "
        old_stty_cfg=$(stty -g)
        stty raw -echo
        answer=$( while ! head -c 1 | grep -i '[ny]' ;do true ;done )
        stty $old_stty_cfg
        if echo "$answer" | grep -iq "^y" ;then
            printf "${DARK_GREEN_16_fg}refreshing the database${NOCOLOR_16_fg}\n"
            refreshdatabase
        else
            printf "%s\n" "passing"
        fi
    ;;
    2)
        clear
        upsys
    ;;
    3)
        clear
        refreshdatabase
    ;;
    4)
        clear
        upLangsPkgs
    ;;
    5)
        clear
        clearLangsCache
    ;;
    6)
        clear
        clearcache
    ;;
    7)
        clear
        clearPackages
    ;;
    8)
        clear
        clearLostFiles
    ;;
    9)
        clear
        listPackagesDS
    ;;
    10)
        clear
        clearSystem
    ;;
    0)
        printf "%s\n" "quit"
        break
    ;;
    *)
        clear
        printf "%s\n" "Invalid Input"
    ;;
    esac
    clear
    printf "%s\n" "Welcome to the System Manager Function (SysMan)"
    printf "%s\n" "This function exists to help you manage your ArchLinux System"
    poptions
    printf "What you want to do? "
done
