# .dotfiles

These are my .dotfiles :]

If you don't know .dotfiles are basically configurations files in unix-like systems

This branch is focused on the Arch Linux distro, this repository will contain all of the .dotfiles from my Linux user journey.

## Script Install

For using the scripts you will need to setup the partitioning of the disk and a network connection on the installation media

My partitioning is the following:

| Name | Size         | Type | Mountpoint        | Filesystem |
|:----:|:------------:|:----:|:-----------------:|:----------:|
| sdX  | FULL-DISK    | disk |                   |            |
| sdXY | 4GB~12GB     | part | [SWAP]            | LINUX-SWAP |
| sdXY | 30GB         | part | /home/${username} | EXT4       |
| sdXY | 50GB         | part | /                 | EXT4       |
| sdXY | REST-OF-DISK | part | /media/Arquivos   | EXT4       |

You can clone the initial script with the following command:

`curl -LO "https://raw.githubusercontent.com/MiraiMindz/.dotfiles/main/scripts/to_test/archInstallBaseRefact.sh" && sh ./archInstallBaseRefact.sh`

After the first script you will need to clone the "After First Boot" script, you can do this with the following line:

`curl -LO "https://raw.githubusercontent.com/MiraiMindz/.dotfiles/main/scripts/to_test/archInstallAfterRefactor.sh" && sh ./archInstallAfterRefactor.sh`

After finishing the Arch Linux installation you can clone the install script of the rice with this line [NEED FIX]:

`curl -LO "https://raw.githubusercontent.com/MiraiMindz/.dotfiles/main/scripts/to_refactor-fix/installConfigs.sh" && sh ./installConfigs.sh`

Enjoy, any trouble or advice on this you can open an issue and I will take a look and help you.

## Manual Install

This manual installation is just a bunch of `cp`, `ln`, `mv` & `rm`

It's pretty straightforward

### I3wm

Remove the auto-created config on `$HOME/.config/i3` and link my config

`rm -rfv $HOME/.config/i3 && ln -sfv $HOME/.dotfiles/environment/i3wm $HOME/.config/i3`

### Polybar

Remove the auto-created config on `$HOME/.config/polybar` and link my config

`rm -rfv $HOME/.config/polybar && ln -sfv $HOME/.dotfiles/environment/polybar $HOME/.config/polybar`

### Picom

Remove the auto-created config on `$HOME/.config/picom` and link my config

`rm -rfv $HOME/.config/picom && ln -sfv $HOME/.dotfiles/environment/picom $HOME/.config/picom`

### Dunst

Link one of my themes to `$HOME/.config/dunst/dunstrc`

Here is an example with the Nord theme:

`ln -sfv $HOME/.dotfiles/environment/dunst/Nord $HOME/.config/dunst/dunstrc`

you can test the with these commands:

```sh
if [[ -e $(which notify-send) ]]; then
    killall -q dunst
    notify-send -u low "Head Low" "Body Low"
    notify-send -u normal "Head Normal" "Body Normal"
    notify-send -u critical "Head Critical" "Body Critical"
fi
```

### Rofi && Rofi Applets

Link my custom themes in the themes folder and replace all Rofi Applets with my applets

`sudo ln -sfv $HOME/.dotfiles/environment/rofi/themes/* /usr/share/rofi/themes/`

`rm -rfv $HOME/.config/rofi/*`

`ln -sfv $HOME/.dotfiles/environment/rofi/applets $HOME/.config/rofi/`

`ln -sfv $HOME/.dotfiles/environment/rofi/bin $HOME/.config/rofi/`

`ln -sfv $HOME/.dotfiles/environment/rofi/launchers $HOME/.config/rofi/`

`ln -sfv $HOME/.dotfiles/environment/rofi/powermenu $HOME/.config/rofi/`

`ln -sfv $HOME/.dotfiles/environment/rofi/config.rasi $HOME/.config/rofi/`

### SDDM

Move my wallpapers to the background folder

`sudo mv -v $HOME/.dotfiles/environment/sddm/Themes/Wallpapers/* /usr/share/sddm/themes/Sugar-Candy/Backgrounds/`

Create the config folder and link my config

`sudo mkdir -v /etc/sddm.conf.d`

`sudo ln -sfv $HOME/.dotfiles/environment/sddm/config.conf /etc/sddm.conf.d/`

Link one of my themes, here is an example with the Nord theme:

`sudo rm -v /usr/share/sddm/themes/Sugar-Candy/theme.conf && sudo cp -v $HOME/.dotfiles/environment/sddm/Themes/Colors/Nord.conf /usr/share/sddm/themes/Sugar-Candy/theme.conf`

### BASH && ZSH

#### BASH

Create a folder on the home directory called `.bash` and link all files except the `.bashrc` to it

`mkdir -pv $HOME/.bash && for i in $HOME/.dotfiles/shells/bash/*; do ln -sfv $i $HOME/.bash/; done`

and link the `.bashrc` to the `$HOME` folder

`rm -v $HOME/.bashrc && ln -sfv $HOME/.dotfiles/shells/bash/.bashrc $HOME/`

#### ZSH

Create a folder on the home directory called `.zsh` and link all files except the `.zshrc` and `.zshenv` to it

`mkdir -pv $HOME/.zsh && for i in $HOME/.dotfiles/shells/zsh/*; do ln -sfv $i $HOME/.zsh/; done`

and link the `.zshrc` and `.zshenv` to the `$HOME` folder

`rm -v $HOME/.zshrc && rm -v $HOME/.zshenv  && ln -sfv $HOME/.dotfiles/shells/zsh/.zshrc $HOME/ && ln -sfv $HOME/.dotfiles/shells/zsh/.zshenv $HOME/`

Work In Progress...

### Packages

- https://github.com/gitGNU/gnu_bash or https://github.com/zsh-users/zsh
- https://github.com/ibhagwan/picom
- https://github.com/Airblader/i3
- https://github.com/dylanaraps/neofetch
- https://github.com/polybar/polybar
- https://github.com/davatorium/rofi
- https://github.com/adi1090x/rofi
- https://github.com/gnome-terminator/terminator
- https://github.com/Swordfish90/cool-retro-term
- https://github.com/vim/vim
- https://github.com/Peltoche/lsd
- https://github.com/tadly/hideIt.sh

### [Color Schemes](https://github.com/MiraiMindz/vim-colorschemes-collection)

https://github.com/MiraiMindz/vim-colorschemes-collection
