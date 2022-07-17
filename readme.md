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



## Packages

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
