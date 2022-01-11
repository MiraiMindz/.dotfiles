#!/usr/bin/env bash

### Text Styles
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

### Functions
initgit() {
    if [[ -e $(which gh) ]]; then
        printf "Github CLI is installed: $(which gh)\n"
        cd $HOME/.dotfiles/
        git init -b main
        git add .
        git commit -m "created .dotfiles repo from script"
        gh repo create
        cd $HOME
    else
        printf "Github CLI was not found, please create a Github repository and come back to this script\n"
        echo -e -n "Do you have created the repository (${DARK_GREEN}y${NOCOLOR}/${DARK_RED}n${NOCOLOR})? "
        old_stty_cfg=$(stty -g)
        stty raw -echo
        answer=$( while ! head -c 1 | grep -i '[ny]' ;do true ;done )
        stty $old_stty_cfg
        if echo "$answer" | grep -iq "^y" ;then
            cd $HOME/.dotfiles/
            git init -b main
            git add .
            git commit -m "created .dotfiles repo from script"
            printf "Please insert the github repository URL: "
            git remote add origin
            git remote -v && git push origin main
            cd $HOME
        else
            printf "exiting\n"
        fi
    fi
}

mkbkp() {
    printf "$1\n"
    mv -v $2 $3
    ln -v -sf $4 $5
}

mkinst() {
    mkdir -v -p $1
    mkdir -v -p $2
    cp -v -r $3 $2
    ln -v -sf $2 $1
}

createDotfiles_BackupDir() {
    if [[ -d $HOME/old_config_backup ]]; then
        printf "${DARK_BLUE}old_config_backup${NOCOLOR} Directory Already Exists\n"
    else
        printf "Creating ${DARK_BLUE}old_config_backup${NOCOLOR} Directory\n"
        mkdir $HOME/old_config_backup
    fi
    if [[ -d $HOME/.dotfiles ]];  then
        printf "${DARK_BLUE}.dotfiles${NOCOLOR} Directory Already Exists\n"
        printf "Backing up\n"
        mv $HOME/.dotfiles/* $HOME/old_config_backup/
    else
        printf "Creating ${DARK_BLUE}.dotfiles${NOCOLOR} Directory\n"
    fi
}

installI3WM() {
    printf "${DARK_GREEN}INSTALLING${NOCOLOR} I3wm Config\n"
}

installPicom() {
    printf "${DARK_GREEN}INSTALLING${NOCOLOR} Picom Config\n"
}

installPolybar() {
    printf "${DARK_GREEN}INSTALLING${NOCOLOR} Polybar Config\n"
}

installTerminator() {
    printf "${DARK_GREEN}INSTALLING${NOCOLOR} Terminator Config\n"
}

installNeofetch() {
    printf "${DARK_GREEN}INSTALLING${NOCOLOR} Neofetch Config\n"
}

installVIM() {
    printf "${DARK_GREEN}INSTALLING${NOCOLOR} VIM Config\n"
}

installBash() {
    printf "${DARK_GREEN}INSTALLING${NOCOLOR} Bash Config\n"
}

installRofi() {
    printf "${DARK_GREEN}INSTALLING${NOCOLOR} Rofi Config\n"
}

installRofiApplets() {
    printf "${DARK_GREEN}INSTALLING${NOCOLOR} Rofi Applets Config\n"
}

checkPackages() {
    _checkPkgs() {
        if [[ -e $(which $1) ]]; then
            printf "$1 is ${DARK_GREEN}INSTALLED${NOCOLOR}\n"
        else
            printf "$1 is ${DARK_RED}MISSING${NOCOLOR}\n"
        fi
    }
    _checkPkgs "i3"
    sleep 0.2
    _checkPkgs "picom"
    sleep 0.2
    _checkPkgs "polybar"
    sleep 0.2
    _checkPkgs "terminator"
    sleep 0.2
    _checkPkgs "neofetch"
    sleep 0.2
    _checkPkgs "vim"
    sleep 0.2
    _checkPkgs "rofi"
    if [[ -d $HOME/.config/rofi ]]; then
        printf "Rofi Applets is ${DARK_GREEN}INSTALLED${NOCOLOR}\n"
    else
        printf "Rofi Applets is ${DARK_RED}MISSING${NOCOLOR}\n"
    fi
}

doinstall() {
    sleep 0.5
    clear
    printf "${DARK_YELLOW}CKECKING FOR PACKAGES${TEXTRESETALL}\n"
    checkPackages
    printf "${DARK_YELLOW}CHECKING COMPLETE, PROCEEDING WITH INSTALLATION${TEXTRESETALL}\n"
    createDotfiles_BackupDir
    installI3WM
    installPicom
    installPolybar
    installTerminator
    installNeofetch
    installVIM
    installBash
    installRofi
    installRofiApplets
}

### Installation

clear
ln0="WARNING"
ln1="THE FOLLOWING SCRIPT WILL INSTALL ALL THE CONFIGURATIONS AUTOMATIC"
ln2="PLEASE ENSURE THAT YOU HAVE THE FOLLOWING PACKAGES INSTALLED."
shopt -s checkwinsize; (:;:)
printf %"$COLUMNS"s |tr " " "="
printf "${TEXTBOLD_ON}${DARK_YELLOW}%*s${TEXTRESETALL}\n" $(((${#ln0}+$COLUMNS)/2)) "$ln0"
printf "${TEXTBOLD_ON}${DARK_RED}%*s${TEXTRESETALL}\n" $(((${#ln1}+$COLUMNS)/2)) "$ln1"
printf "${TEXTBOLD_ON}${DARK_RED}%*s${TEXTRESETALL}\n" $(((${#ln2}+$COLUMNS)/2)) "$ln2"
printf %"$COLUMNS"s |tr " " "="

printf "${DARK_GREEN}Picom ${DARK_PURPLE}[Ibhagwan Fork]${DARK_BLUE}(https://github.com/ibhagwan/picom)\n${DARK_GREEN}i3wm${DARK_BLUE} (https://github.com/Airblader/i3)\n${DARK_GREEN}Neofetch${DARK_BLUE} (https://github.com/dylanaraps/neofetch)\n${DARK_GREEN}Polybar${DARK_BLUE} (https://github.com/polybar/polybar)\n${DARK_GREEN}Rofi${DARK_BLUE} (https://github.com/davatorium/rofi)\n${DARK_GREEN}Rofi Applets${DARK_BLUE} (https://github.com/adi1090x/rofi)\n${DARK_GREEN}Terminator${DARK_BLUE} (https://github.com/gnome-terminator/terminator)\n${DARK_GREEN}Vim${DARK_BLUE} (https://github.com/vim/vim)\n"

printf "${DARK_YELLOW}THIS SCRIPT WILL CREATE A FOLDER INSIDE THE ${DARK_CYAN}\$HOME ${DARK_BLUE}($HOME)${DARK_YELLOW} DIRECTIORY CALLED ${DARK_CYAN}.dotfiles${DARK_YELLOW}\nAND THEN WILL CREATE SYMLINKS FROM THAT DIRECTORY TO THE ORIGINAL CONFIG FILES.\nIF ANY CONFIGURATION IS FOUND IT WILL BE BACKED UP IN A CREATED FOLDER ${DARK_BLUE}($HOME/old_config_backup)${DARK_YELLOW}\nTHIS SCRIPT USES THE BOURNE AGAIN SHELL (BASH) AS MAIN USER SHELL\nIF YOU USE THE Z SHELL (ZSH) PLEASE DENY THE SHELL IMPORTS WHEN PROMPTED${TEXTRESETALL}\n"

echo -e -n "Do you have these packages installed (${DARK_GREEN}y${NOCOLOR}/${DARK_RED}n${NOCOLOR})? "
old_stty_cfg=$(stty -g)
stty raw -echo
answer=$( while ! head -c 1 | grep -i '[ny]' ;do true ;done )
stty $old_stty_cfg
if echo "$answer" | grep -iq "^y" ;then
    printf "${DARK_GREEN}INSTALLING${TEXTRESETALL}\n"
    doinstall
else
    printf "${DARK_RED}ABORTING${NOCOLOR}\n"
fi

