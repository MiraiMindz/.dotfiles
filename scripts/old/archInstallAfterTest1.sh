#!/usr/bin/env bash

#############################################################################
#                          AFTER FIRST BOOT SCRIPT                          #
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
#   [x] Install The Custom Packages                                         #
#   [x] Apply the Rice                                                      #
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

printf "????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????\n"
printf "???               Welcome to Mirai's Arch Linux Install Script               ???\n"
printf "??? This is the ${DARK_YELLOW}AFTER FIRST BOOT${NOCOLOR} Script\t\t\t\t\t   ???\n"
printf "??? This script was made to make my life easy when installing Arch Linux     ???\n"
printf "??? It will install base packages for MY USE CASE, in this part              ???\n"
printf "??? This script will install my rice and my packages                         ???\n"
printf "??? Before using this one you will need to set some stuff, here is the list: ???\n"
printf "???   - Network Connection                                                   ???\n"
printf "???             So without further ado, let's start this script              ???\n"
printf "????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????\n"

printf "Enabling NetworkManager with SystemD\n"
systemctl enable NetworkManager
printf "Enabling IWD with SystemD\n"
systemctl enable iwd
printf "Enabling DHCPCD with SystemD\n"
systemctl enable dhcpcd

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

echo -e -n "Do you want to update pacman mirrorlist (y/n)? "
old_stty_cfg=$(stty -g)
stty raw -echo
answer=$( while ! head -c 1 | grep -i '[ny]' ;do true ;done )
stty $old_stty_cfg
if echo "$answer" | grep -iq "^y" ;then
  printf "Updating pacman mirrorlist\n"
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
else
    printf "Proceeding\n"
fi

printf "Setting up pacman to parallel download, verbosity and colors\n"
printf "Setting 5 parallel downloads\n"
sed -i "s/#ParallelDownloads = 5/ParallelDownloads = 5/" /etc/pacman.conf
printf "Setting verbose package list\n"
sed -i "s/#VerbosePkgLists/VerbosePkgLists/" /etc/pacman.conf
printf "Setting colors\n"
sed -i "s/#Color/Color/" /etc/pacman.conf

printf "Setting up pacman to use custom repositories\n"
printf "Please uncomment the repos that you want to use\n"
nano /etc/pacman.conf

pacman -Syyy

printf "Installing graphical drives, display server, audio mixer & user directories\n"
pacman -S xf86-video-intel xorg pipewire lib32-pipewire pipewire-pulse pavucontrol xdg-user-dirs
systemctl enable pipewire-pulse.service

printf "Installing environment packages:\n"
printf "Display Manager, Window Manager, Terminal, Status Bar, Compositor, Notification system, App launcher\n"
pacman -S sddm i3-gaps terminator dunst rofi feh

sleep 2
printf "Enabling SDDM display manager\n"
systemctl enable sddm.service

printf "Setting up custom use-case packages\n"
pacman -S git discord gnome-keyring docker firefox font-manager github-cli grub-customizer lxappearance ncurses neovim vim pacman-contrib pacman-mirrorlist pacutils thunar thunar-archive-plugin thunar-media-tags-plugin thunar-volman tumbler zsh zsh-completions zsh-syntax-highlighting openssh openssl gvfs gvfs-mtp spectacle perl neofetch btop android-file-transfer android-tools android-udev pragha pkgfile shellcheck

printf "Refreshing PKGFILE Mirrors\n"
pkgfile --update

printf "Installation Done.\n"

printf "INSTRUCTIONS READ BEFORE DOING\n"
printf "Reboot by typing: ${DARK_YELLOW}reboot${NOCOLOR}\n"
printf "Select the i3 as Desktop Environment\n"
printf "Login on your user on the SDDM Display Manager\n"
printf "Open the Terminator terminal with the keybind: ${DARK_YELLOW}\$ModKey+Enter${NOCOLOR}\n"
printf "Clone the Install Configs (Rice) with this command:\n"
printf "${DARK_YELLOW}curl -fLo installConfigs.sh \"https://raw.githubusercontent.com/MiraiMindz/.dotfiles/main/installConfigs.sh\"${NOCOLOR}\n"
printf "Run the new script with: ${DARK_YELLOW}sh installConfigs.sh${NOCOLOR}\n"
printf "${DARK_GREEN}Enjoy and Good Luck${NOCOLOR}! \n"
exit
