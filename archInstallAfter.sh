#!/usr/bin/env bash

#############################################################################
#                          BEFORE FIRST BOOT SCRIPT                         #
#############################################################################
#    This script was made to make my life easy when installing Arch Linux   #
# It will install base packages for MY USE CASE, and apply the Rice install #
#    Before using it you will need to set some stuff, here is the list:     #
#   - Network Connection                                                    #
#                                                                           #
#                 So without further ado, let's get into it                 #
#############################################################################
# TODO LIST:                                                                #
#   [x] Enable NetworkManager | systemctl                                   #
#   [x] Create User & User Password                                         #
#   [x] Add user to Wheel Group                                             #
#   [x] Set up Pacman to parallel download                                  #
#   [x] Install Yay AUR Helper                                              #
#   [x] Install Graphics                                                    #
#   [x] Install Display Server                                              #
#   [x] Install PulseAudio-PavuControl                                      #
#   [x] Install XDG-User-Dirs | Maybe configure it                          #
#   [x] Install Display Manager                                             #
#   [x] Activate Display Manager                                            #
#   [x] Install Desktop Environment / Window Manager                        #
#   [] Install The Custom Packages                                          #
#   [] Apply the Rice                                                       #
#############################################################################

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

### Helper Funcs

yayPacmanInstall() {
    if [[ -e $(which yay) ]]; then
        yay -S "$@"
    else
        pacman -S "$@"
    fi
}

printf "Welcome to Mirai's Arch Linux Install Script\n"
printf "This is the ${DARK_YELLOW}AFTER FIRST BOOT${NOCOLOR} Script\n"
printf "This script was made to make my life easy when installing Arch Linux\n"
printf "It will install base packages for MY USE CASE, in this part\n"
printf "On the After First Boot Script, that script will install my rice and my packages\n"
printf "Before using this one you will need to set some stuff, here is the list:\n"
printf "    - Network Connection\n"
printf "So without further ado, let's start this script\n"

printf "Enabling NetworkManager with SystemD\n"
systemctl enable NetworkManager

printf "Creating new user\n"
read -e -p "Please enter the username: " USRNM
useradd -m -G wheel $USRNM

printf "Creating the password for the user ${USRNM}\n"
passwd $USRNM

printf "Adding user ${USRNM} to WHEEL group in sudoers file\n"
printf "For security reasons this need to be done by the visudo command\n"
printf "Please uncomment the following line in the sudoers file:\n"
printf "${DARK_YELLOW}# %%wheel ALL=(ALL) ALL${NOCOLOR}\n"
printf "use CTRL+O to save the file and CTRL+X to exit the editor\n"
EDITOR=nano visudo

printf "Setting up pacman to parallel download, verbosity and colors\n"
printf "Setting 5 parallel downloads\n"
sed -i "s/#ParallelDownloads = 5/ParallelDownloads = 5/" /etc/pacman.conf
printf "Setting verbose package list\n"
sed -i "s/#VerbosePkgLists/VerbosePkgLists/" /etc/pacman.conf
printf "Setting colors\n"
sed -i "s/#Color/Color/" /etc/pacman.conf

printf "Setting up pacman to use the multilib repository\n"
sed -i "s/#[multilib]/[multilib]/" /etc/pacman.conf
sed -i "s/#Include = \/etc\/pacman.d\/mirrorlist/Include = \/etc\/pacman.d\/mirrorlist/" /etc/pacman.conf

printf "Installing Yay AUR Helper\n"
pacman -S git
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si
cd ../
rm -rf ./yay

printf "Installing graphical drives, display server, audio mixer & user directories\n"
yayPacmanInstall xf86-video-intel xorg pulseaudio pavucontrol xdg-user-dirs

printf "Installing environment packages:\n"
printf "Display Manager, Window Manager, Terminal, Status Bar, Compositor, Notification system, App launcher\n"
printf "Installing SDDM display manager\n"
yayPacmanInstall sddm i3-gaps terminator polybar-git dunst picom-ibhagwan-git rofi

printf "Enabling SDDM display manager\n"
systemctl enable sddm.service

printf "Setting up custom use case packages\n"
