#!/usr/bin/env bash

printf "Installing Yay AUR Helper\n"
pacman -S git
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si
cd ../
rm -rf ./yay

yay -S picom-ibhagwan-git cool-retro-term-git hideit.sh-git scrcpy sndcpy.sh sddm-theme-sugar-candy-git kdeconnect indicator-kdeconnect-git

echo -e -n "Do you want to install Razer Drivers (y/n)? "
old_stty_cfg=$(stty -g)
stty raw -echo
answer=$( while ! head -c 1 | grep -i '[ny]' ;do true ;done )
stty $old_stty_cfg
if echo "$answer" | grep -iq "^y" ;then
    printf "Installing Packages\n"
    yayPacmanInstall openrazer-daemon openrazer-driver-dkms openrazer-meta polychromatic noise-suppression-for-voice
    gpasswd -a $USRNM plugdev
else
    printf "Proceeding\n"
fi

exit
