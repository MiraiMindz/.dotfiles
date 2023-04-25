# .dotfiles

## Avisos

eu preciso limpar e re-estruturar esses .dotfiles, pois algumas das configurações que eu usei tiveram atualizações drasticas, além d'eu ter que organizar para facilitar manutenção e futuras implementações de scripts ou afins.

-----

Para a versão em português brasileiro clique [aqui](./readme_br.md)

If you don't know .dotfiles are basically configurations files in unix-like systems

This branch is focused on the Arch Linux distro, this repository will contain all of the .dotfiles from my Linux user journey.

## Themes

I've themed my system a lot through time and I saved every variation of it, the themes today are:

- Nord
- Catpuccin
- Catpuccin (with 8-bits fonts)
- Dracula
- Material Ocean

## Script Install

For using the scripts you will need to setup the partitioning of the disk and a network connection on the installation media

My partitioning is the following on a 500GB Disk:

| Name | Size         | Type | Mountpoint        | Filesystem |
|:----:|:------------:|:----:|:-----------------:|:----------:|
| sdX  | FULL-DISK    | disk |                   |            |
| sdXY | 4GB~12GB     | part | [SWAP]            | LINUX-SWAP |
| sdXY | 30GB         | part | /home             | EXT4       |
| sdXY | 50GB         | part | /                 | EXT4       |
| sdXY | REST-OF-DISK | part | /media/Arquivos   | EXT4       |

***NOTE: I ONLY USE THE SWAP PARTITION WHEN NECESSARY***

## Packages

These are the packages that I'm using for the system-setup.

- <https://github.com/gitGNU/gnu_bash> or <https://github.com/zsh-users/zsh>
- <https://github.com/ibhagwan/picom>
- <https://github.com/Airblader/i3>
- <https://github.com/dylanaraps/neofetch>
- <https://github.com/polybar/polybar>
- <https://github.com/davatorium/rofi>
- <https://github.com/adi1090x/rofi>
- <https://github.com/gnome-terminator/terminator>
- <https://github.com/Swordfish90/cool-retro-term>
- <https://github.com/vim/vim>
- <https://github.com/Peltoche/lsd>
- <https://github.com/tadly/hideIt.sh>

### [VIM Color Schemes](https://github.com/MiraiMindz/vim-colorschemes-collection)

<https://github.com/MiraiMindz/vim-colorschemes-collection>
