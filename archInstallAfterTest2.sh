#!/usr/bin/env bash

USRNM=mirai

printf "Installing Yay AUR Helper\n"
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si
cd ../
rm -rf ./yay

yay -S picom-ibhagwan-git cool-retro-term-git hideit.sh-git scrcpy sndcpy.sh sddm-theme-sugar-candy-git kdeconnect indicator-kdeconnect-git shfs spotify polybar-git

echo -e -n "Do you want to install Razer Drivers (y/n)? "
old_stty_cfg=$(stty -g)
stty raw -echo
answer=$( while ! head -c 1 | grep -i '[ny]' ;do true ;done )
stty $old_stty_cfg
if echo "$answer" | grep -iq "^y" ;then
    printf "Installing Packages\n"
    yay -S openrazer-daemon openrazer-driver-dkms openrazer-meta polychromatic noise-suppression-for-voice
    gpasswd -a $USRNM plugdev
else
    printf "Proceeding\n"
fi

if [[ -e $(which git) ]]; then
  git clone --depth=1 https://github.com/adi1090x/rofi.git
  cd rofi
  chmod +x setup.sh
  ./setup.sh
  cd ../
  rm -rf ./rofi/
fi

printf "Downloading net packages\n"
if [[ -d /home/$USRNM ]];then
    if [[ -d /home/$USRNM/Apps ]];then
        printf "Installing Visual Studio Code.\n"
        mkdir -p /home/$USRNM/Apps/VisualStudioCode
        cd /home/$USRNM/Apps/VisualStudioCode
        curl -LO "https://code.visualstudio.com/sha/download?build=stable&os=linux-x64"
        tar -xvf code-stable-x64.tar.gz
        ln -sf ./VSCode-linux-x64/code /usr/bin/vscode
    else
        printf "Unable to Download & Install Visual Studio Code.\n"
    fi
else
    printf "User home directory not found.\n"
fi

printf "Setting up Go\n"
if [[ -e $(which go) ]]; then
    if [[ -d /home/$USRNM ]]; then
        if [[ -d /home/$USRNM/go ]]; then
            mkdir -p /home/$USRNM/go/src
            export PATH="$PATH:/home/$USRNM/go/bin"
            printf "Checking Go env\n"
            go env
        else
            printf "Unable to set the \$GOPATH variable.\n"
        fi
    else
        printf "User home directory not found.\n"
    fi
fi

printf "Adding ${USRNM} to docker group\n"
groupadd docker
usermod -aG docker $USRNM
printf "Enabling docker service\n"
systemctl start docker.service
systemctl enable docker.service
printf "Testing docker\n"
docker info
printf "Done.\n"

exit
