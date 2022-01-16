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

BACKUPFOLDER=$HOME/old_config_backup
DOTFILESDIR=$HOME/.dotfiles

### Functions

mkbkp() {
    mkdir -v -p $1
    mv -v $2/* $1/
    printf "Backup done, proceeding with Installation.\n"
}

initgit() {
    if [[ -e $(which gh) ]]; then
        printf "Github CLI is installed: $(which gh)\n"
        cd $DOTFILESDIR/
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
            cd $DOTFILESDIR/
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

createDotfiles_BackupDir() {
    if [[ -d $BACKUPFOLDER ]]; then
        printf "${DARK_BLUE}$BACKUPFOLDER${NOCOLOR} Directory Already Exists\n"
        mkdir $HOME/old_config_backup2
        mv -v BACKUPFOLDER/* $HOME/old_config_backup2
    else
        printf "Creating ${DARK_BLUE}$BACKUPFOLDER${NOCOLOR} Directory\n"
        mkdir $BACKUPFOLDER/
    fi
    if [[ -d $HOME/.dotfiles ]];  then
        printf "${DARK_BLUE}$DOTFILESDIR${NOCOLOR} Directory Already Exists\n"
        printf "Backing up\n"
        mv -v $DOTFILESDIR/* $BACKUPFOLDER/
        mv -v * $DOTFILESDIR/
    else
        printf "Creating ${DARK_BLUE}$DOTFILESDIR${NOCOLOR} Directory\n"
        mkdir $DOTFILESDIR
        mv -v * $DOTFILESDIR/
    fi
}

installI3WM() {
    if [[ -e $(which i3) ]]; then
        printf "${DARK_GREEN}INSTALLING${NOCOLOR} I3wm Config\n"
        if [[ -d $HOME/.config/i3 ]]; then
            printf "i3 config found, creating backup in $BACKUPFOLDER/\n"
            mkbkp $BACKUPFOLDER/i3wm $HOME/.config/i3
            rmdir $HOME/.config/i3
            ln -v -sf $HOME/.dotfiles/environment/i3wm $HOME/.config/i3
        else
            rmdir $HOME/.config/i3
            ln -v -sf $HOME/.dotfiles/environment/i3wm $HOME/.config/i3
        fi
    fi
}

installPicom() {
    if [[ -e $(which picom) ]]; then
        printf "${DARK_GREEN}INSTALLING${NOCOLOR} Picom Config\n"
        if [[ -d $HOME/.config/picom ]]; then
            printf "picom config found, creating backup in $BACKUPFOLDER/\n"
            mkbkp $BACKUPFOLDER/picom $HOME/.config/picom
            rmdir $HOME/.config/picom
            ln -v -sf $HOME/.dotfiles/environment/picom $HOME/.config/
        else
            rmdir $HOME/.config/picom
            ln -v -sf $HOME/.dotfiles/environment/picom $HOME/.config/
        fi
    fi
}

installPolybar() {
    if [[ -e $(which polybar) ]]; then
        printf "${DARK_GREEN}INSTALLING${NOCOLOR} Polybar Config\n"
        if [[ -e $HOME/.config/polybar ]]; then
            printf "polybar config found, creating backup in $BACKUPFOLDER/\n"
            mkbkp $BACKUPFOLDER/polybar $HOME/.config/polybar
            rmdir $HOME/.config/polybar
            ln -v -sf $HOME/.dotfiles/environment/polybar $HOME/.config/
        else
            rmdir $HOME/.config/polybar
            ln -v -sf $HOME/.dotfiles/environment/polybar $HOME/.config/
        fi
    fi
}

installTerminator() {
    if [[ -e $(which terminator) ]]; then
        printf "${DARK_GREEN}INSTALLING${NOCOLOR} Terminator Config\n"
        if [[ -d $HOME/.config/terminator ]]; then
            printf "terminator config found, creating backup in $BACKUPFOLDER\n"
            mkbkp $BACKUPFOLDER/terminator $HOME/.config/terminator
            rmdir $HOME/.config/terminator
            ln -v -sf $HOME/.dotfiles/environment/terminator $HOME/.config/
        else
            rmdir $HOME/.config/terminator
            ln -v -sf $HOME/.dotfiles/environment/terminator $HOME/.config/
        fi
    fi
}



installNeofetch() {
    if [[ -e $(which neofetch) ]];then
        printf "${DARK_GREEN}INSTALLING${NOCOLOR} Neofetch Config\n"
        if [[ -d $HOME/.config/neofetch ]]; then
            printf "neofetch config found, creating backup in $BACKUPFOLDER\n"
            mkbkp $BACKUPFOLDER/neofetch $HOME/.config/neofetch
            rmdir $HOME/.config/neofetch
            ln -sf $HOME/.dotfiles/neofetch $HOME/.config/
        else
            rmdir $HOME/.config/neofetch
            ln -sf $HOME/.config/neofetch $HOME/.config/
        fi
    fi
}

installVIM() {
    if [[ -e $(which vim) ]]; then
        printf "${DARK_GREEN}INSTALLING${NOCOLOR} VIM Config\n"
    fi
}

installNeoVIM() {
    if [[ -e $(which neovim) ]]; then
        printf "${DARK_GREEN}INSTALLING${NOCOLOR} NeoVIM Config\n"
    fi
}

installVI() {
    if [[ -e $(which vi) ]]; then
        printf "${DARK_GREEN}INSTALLING${NOCOLOR} VI Config\n"
    fi
}

installBash() {
    echo -e -n "Do you want to import the bash configs (${DARK_GREEN}y${NOCOLOR}/${DARK_RED}n${NOCOLOR})? "
    old_stty_cfg=$(stty -g)
    stty raw -echo
    answer=$( while ! head -c 1 | grep -i '[ny]' ;do true ;done )
    stty $old_stty_cfg
    if echo "$answer" | grep -iq "^y" ;then
        printf "${DARK_GREEN}INSTALLING${NOCOLOR} Bash Config\n"
    else
        printf "${DARK_RED}PASSING${NOCOLOR}\n"
    fi
}

installRofi() {
    if [[ -e $(which rofi) ]]; then
        printf "${DARK_GREEN}INSTALLING${NOCOLOR} Rofi Config\n"
    fi
}

installRofiApplets() {
    if [[ -d $HOME/.config/rofi ]]; then
        printf "${DARK_GREEN}INSTALLING${NOCOLOR} Rofi Applets Config\n"
    fi
}

installCoolRetroTerm() {
    if [[ -e $(which cool-retro-term) ]]; then
        printf "${DARK_GREEN}INSTALLING${NOCOLOR} cool-retro-term Config\n"
    fi
}

installSDDMTheme() {
    if [[ -e $(which sddm) ]]; then
        if [[ -d /usr/share/sddm/themes/Sugar-Candy ]]; then
            printf "${DARK_GREEN}INSTALLING${NOCOLOR} SDDM Sugar Candy Theme Config\n"
        else
            printf "Install the Sugar Candy Theme ${DARK_BLUE} (https://github.com/Kangie/sddm-sugar-candy)${NOCOLOR}\n"
            printf "And run the following commands\n"
            printf "${DARK_YELLOW}sudo mv -v \$HOME/.dotfiles/environment/sddm/Themes/Wallpapers/* /usr/share/sddm/themes/Sugar-Candy/Backgrounds/${NOCOLOR}"
            printf "${DARK_YELLOW}sudo ln -sf /usr/share/sddm/themes/Sugar-Candy/* \$HOME/.dotfiles/environment/sddm/Themes/SugarCandy/${NOCOLOR}"
            printf "${DARK_YELLOW}sudo mkdir /etc/sddm.conf.d${NOCOLOR}\n"
            printf "${DARK_YELLOW}sudo ln -sf \$HOME/.dotfiles/environment/sddm/config.conf /etc/sddm.conf.d/${NOCOLOR}\n"
        fi
    fi
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
    _checkPkgs "picom"
    _checkPkgs "polybar"
    _checkPkgs "terminator"
    _checkPkgs "cool-retro-term"
    _checkPkgs "neofetch"
    _checkPkgs "vim"
    _checkPkgs "neovim"
    _checkPkgs "vi"
    _checkPkgs "rofi"
    if [[ -d $HOME/.config/rofi ]]; then
        printf "Rofi Applets is ${DARK_GREEN}INSTALLED${NOCOLOR}\n"
    else
        printf "Rofi Applets is ${DARK_RED}MISSING${NOCOLOR}\n"
    fi
    _checkPkgs "sddm"
    if [[ -d /usr/share/sddm/themes/Sugar-Candy ]]; then
        printf "SDDM Sugar Candy Theme is ${DARK_GREEN}INSTALLED${NOCOLOR}\n"
    else
        printf "SDDM Sugar Candy Theme is ${DARK_RED}MISSING${NOCOLOR}\n"
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
    installCoolRetroTerm
    installNeofetch
    installVIM
    installNeoVIM
    installVI
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

printf "${DARK_GREEN}Picom ${DARK_PURPLE}[Ibhagwan Fork]${DARK_BLUE}(https://github.com/ibhagwan/picom)\n${DARK_GREEN}i3wm${DARK_BLUE} (https://github.com/Airblader/i3)\n${DARK_GREEN}Neofetch${DARK_BLUE} (https://github.com/dylanaraps/neofetch)\n${DARK_GREEN}Polybar${DARK_BLUE} (https://github.com/polybar/polybar)\n${DARK_GREEN}Rofi${DARK_BLUE} (https://github.com/davatorium/rofi)\n${DARK_GREEN}Rofi Applets${DARK_BLUE} (https://github.com/adi1090x/rofi)\n${DARK_GREEN}Terminator${DARK_BLUE} (https://github.com/gnome-terminator/terminator)\n${DARK_GREEN}Cool Retro Term${DARK_BLUE} (https://github.com/Swordfish90/cool-retro-term)\n${DARK_GREEN}Vim${DARK_BLUE} (https://github.com/vim/vim)\n${DARK_GREEN}SDDM ${DARK_BLUE}(https://github.com/sddm/sddm)\n${DARK_GREEN}SDDM Sugar Candy${DARK_BLUE} (https://github.com/Kangie/sddm-sugar-candy)${NOCOLOR}\n"

printf "${DARK_YELLOW}THIS SCRIPT WILL CREATE A FOLDER INSIDE THE ${DARK_CYAN}\$HOME ${DARK_BLUE}($HOME)${DARK_YELLOW} DIRECTIORY CALLED ${DARK_CYAN}.dotfiles${DARK_YELLOW}\nAND THEN WILL CREATE SYMLINKS FROM THAT DIRECTORY TO THE ORIGINAL CONFIG FILES.\nIF ANY CONFIGURATION IS FOUND IT WILL BE BACKED UP IN A CREATED FOLDER ${DARK_BLUE}($BACKUPFOLDER/)${DARK_YELLOW}\nTHIS SCRIPT USES THE BOURNE AGAIN SHELL (BASH) AS MAIN USER SHELL\nIF YOU USE THE Z SHELL (ZSH) PLEASE DENY THE SHELL IMPORTS WHEN PROMPTED${TEXTRESETALL}\n"

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

