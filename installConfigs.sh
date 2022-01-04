#!/usr/bin/env bash

initgit() {
    git init -b main && git add . && git commit -m "created .dotfiles repo from script" && git remote add origin "$1" && git remote -v && git push origin main
}

doinstall() {
    printf "\e[32mSTARTING INSTALLATION\e[0m\nChecking if all the packages are installed\nand proceeding with the instalation\n"
    if [[ -d $HOME/.dotfiles ]]; then
        printf ".dotfiles directory exists: $HOME/.dotfiles\n"
    else
        printf ".dotfiles directory doesn't exists creating one\n"
        mkdir -v -p $HOME/.dotfiles
    fi

    if [[ -e $(which picom) ]]; then
        printf "Picom is installed: $(which picom)\n"
        mkdir -v -p $HOME/.dotfiles/picom
        if [[ -d $HOME/.config/picom ]]; then
            printf "Picom config directory found in $HOME/.config/picom creating backup copy of it's contents in $HOME/PREVIOUS_CONFIG_BACKUP\n"
            mkdir -p $HOME/PREVIOUS_CONFIG_BACKUP/picom
            mv -v $HOME/.config/picom/* $HOME/PREVIOUS_CONFIG_BACKUP/picom/
            printf "BACKUP DONE, PROCEEDING WITH THE INSTALLATION\n"
            mkdir -v -p $HOME/.dotfiles/picom
            cp -v -r ./picom/* $HOME/.dotfiles/picom/
            ln -v -sf $HOME/.dotfiles/picom/* $HOME/.config/picom/
        else
            mkdir -v -p $HOME/.config/picom
            mkdir -v -p $HOME/.dotfiles/picom
            cp -v -r ./picom/* $HOME/.dotfiles/picom/
            ln -v -sf $HOME/.dotfiles/picom/* $HOME/.config/picom/
        fi
    else
        printf "Picom is not installed\n"
    fi

    if [[ -e $(which neofetch) ]]; then
        printf "Neofetch is installed: $(which neofetch)\n"
        if [[ -d $HOME/.config/neofetch ]]; then
            printf "Neofetch config directory found in $HOME/.config/neofetch creating backup copy of it's contents in $HOME/PREVIOUS_CONFIG_BACKUP\n"
            mkdir -p $HOME/PREVIOUS_CONFIG_BACKUP/neofetch
            mv -v $HOME/.config/neofetch/* $HOME/PREVIOUS_CONFIG_BACKUP/neofetch/
            printf "BACKUP DONE, PROCEEDING WITH THE INSTALLATION\n"
            mkdir -v -p $HOME/.dotfiles/neofetch
            cp -v -r ./neofetch/* $HOME/.dotfiles/neofetch/
            ln -v -sf $HOME/.dotfiles/neofetch/* $HOME/.config/neofetch/
        else
            mkdir -v -p $HOME/.config/neofetch
            mkdir -v -p $HOME/.dotfiles/neofetch
            cp -v -r ./neofetch/* $HOME/.dotfiles/neofetch/
            ln -v -sf $HOME/.dotfiles/neofetch/* $HOME/.config/neofetch/
        fi
    else
        printf "Neofetch is not installed\n"
    fi

    if [[ -e $(which polybar) ]]; then
        printf "Polybar is installed: $(which polybar)\n"
        if [[ -d $HOME/.config/polybar ]]; then
            printf "Polybar config directory found in $HOME/.config/polybar creating backup copy of it's contents in $HOME/PREVIOUS_CONFIG_BACKUP\n"
            mkdir -p $HOME/PREVIOUS_CONFIG_BACKUP/polybar
            mv -v $HOME/.config/polybar/* $HOME/PREVIOUS_CONFIG_BACKUP/polybar/
            printf "BACKUP DONE, PROCEEDING WITH THE INSTALLATION\n"
            mkdir -v -p $HOME/.dotfiles/polybar
            cp -v -r ./polybar/* $HOME/.dotfiles/polybar/
            ln -v -sf $HOME/.dotfiles/polybar/* $HOME/.config/polybar/
        else
            mkdir -v -p $HOME/.config/polybar
            mkdir -v -p $HOME/.dotfiles/polybar
            cp -v -r ./polybar/* $HOME/.dotfiles/polybar/
            ln -v -sf $HOME/.dotfiles/polybar/* $HOME/.config/polybar/
        fi
    else
        printf "Polybar is not installed\n"
    fi

    if [[ -e $(which terminator) ]]; then
        printf "Terminator is installed: $(which terminator)\n"
        if [[ -d $HOME/.config/terminator ]]; then
            printf "Terminator config directory found in $HOME/.config/terminator creating backup copy of it's contents in $HOME/PREVIOUS_CONFIG_BACKUP\n"
            mkdir -p $HOME/PREVIOUS_CONFIG_BACKUP/terminator
            mv -v $HOME/.config/terminator/* $HOME/PREVIOUS_CONFIG_BACKUP/terminator/
            printf "BACKUP DONE, PROCEEDING WITH THE INSTALLATION\n"
            mkdir -v -p $HOME/.dotfiles/terminator
            cp -v -r ./terminator/* $HOME/.dotfiles/terminator/
            ln -v -sf $HOME/.dotfiles/terminator/* $HOME/.config/terminator/
        else
            mkdir -v -p $HOME/.config/terminator
            mkdir -v -p $HOME/.dotfiles/terminator
            cp -v -r ./terminator/* $HOME/.dotfiles/terminator/
            ln -v -sf $HOME/.dotfiles/terminator/* $HOME/.config/terminator/
        fi
    else
        printf "Terminator is not installed\n"
    fi

    if [[ -e $(which i3) ]]; then
        printf "i3wm is installed: $(which i3)\n"
        if [[ -d $HOME/.config/i3 ]]; then
            printf "i3WM config directory found in $HOME/.config/i3 creating backup copy of it's contents in $HOME/PREVIOUS_CONFIG_BACKUP\n"
            mkdir -p $HOME/PREVIOUS_CONFIG_BACKUP/i3wm
            mv -v $HOME/.config/i3/* $HOME/PREVIOUS_CONFIG_BACKUP/i3wm/
            printf "BACKUP DONE, PROCEEDING WITH THE INSTALLATION\n"
            mkdir -v -p $HOME/.dotfiles/i3wm
            cp -v -r ./i3wm/* $HOME/.dotfiles/i3wm/
            ln -v -sf $HOME/.dotfiles/i3wm/* $HOME/.config/i3/
        else
            mkdir -v -p $HOME/.config/i3
            mkdir -v -p $HOME/.dotfiles/i3wm
            cp -v -r ./i3wm/* $HOME/.dotfiles/i3wm/
            ln -v -sf $HOME/.dotfiles/i3wm/* $HOME/.config/i3/
        fi
    else
        printf "i3wm is not installed\n"
    fi

    if [[ -e $(which vim) ]]; then
        printf "Vim is installed: $(which vim)\n"
        if [[ -d $HOME/.vim ]]; then
            printf "VIM config directory found in $HOME/.vim creating backup copy of it's contents in $HOME/PREVIOUS_CONFIG_BACKUP\n"
            mkdir -p $HOME/PREVIOUS_CONFIG_BACKUP/vim
            mv -v $HOME/.vim/* $HOME/PREVIOUS_CONFIG_BACKUP/vim/
            printf "BACKUP DONE, PROCEEDING WITH THE INSTALLATION\n"
            mkdir -v -p $HOME/.dotfiles/vim
            mkdir -v -p $HOME/.dotfiles/vim/plugins
            cp -v -r ./vim/{autoload,.vimrc} $HOME/.dotfiles/vim/
            ln -v -sf $HOME/.dotfiles/vim/autoload $HOME/.vim/
            ln -v -sf $HOME/.dotfiles/vim/.vimrc $HOME/
            printf "Now open your \e[32m\e[3mVIM\e[23m\e[0m and run \e[33m:PlugInstall\e[0m to install the plugins\n"
        else
            mkdir -v -p $HOME/.vim
            mkdir -v -p $HOME/.dotfiles/vim
            mkdir -v -p $HOME/.dotfiles/vim/plugins
            cp -v -r ./vim/{autoload,.vimrc} $HOME/.dotfiles/vim/
            ln -v -sf $HOME/.dotfiles/vim/autoload $HOME/.vim/
            ln -v -sf $HOME/.dotfiles/vim/.vimrc $HOME/
            printf "Now open your \e[32m\e[3mVIM\e[23m\e[0m and run \e[33m:PlugInstall\e[0m to install the plugins\n"
        fi
    else
        printf "Vim is not installed\n"
    fi

    if [[ -d $HOME/.config/rofi ]]; then
        printf "Rofi Applets is installed: $HOME/.config/rofi\n"
        printf "Rofi Applets configs directory found in $HOME/.config/rofi creating backup copy of it's contents in $HOME/PREVIOUS_CONFIG_BACKUP\n"
        mkdir -p $HOME/PREVIOUS_CONFIG_BACKUP/rofi
        mv -v $HOME/.config/rofi/* $HOME/PREVIOUS_CONFIG_BACKUP/rofi/
        mkdir -v -p $HOME/.dotfiles/rofi
        cp -v -r ./rofi/* $HOME/.dotfiles/rofi/
        ln -v -sf $HOME/.dotfiles/rofi/{applets,bin,powermenu,launchers,config.rasi} $HOME/.config/rofi/
    else
        printf "Rofi Applets is not installed\n"
    fi

    if [[ -e $(which rofi) ]]; then
        printf "Rofi is installed: $(which rofi)\n"
        printf "Rofi Themes directory found in /usr/share/rofi/themes creating backup copy of it's contents in $HOME/PREVIOUS_CONFIG_BACKUP\n"
        mkdir -p $HOME/PREVIOUS_CONFIG_BACKUP/rofi
        printf "\e[33mTHE FOLLOWING CONFIGS (ROFI) NEEDS SUDO PERMISSIONS AS THE FILES ARE CREATED UNDER THE \e[34m/usr\e[33m DIRECTORY"
        mv -v /usr/share/rofi/themes $HOME/PREVIOUS_CONFIG_BACKUP/rofi/
        printf "BACKUP DONE, PROCEEDING WITH THE INSTALLATION\n"
        mkdir -v -p $HOME/.dotfiles/rofi
        if [[ -d $HOME/.dotfiles/rofi/themes ]]; then
            ln -sf $HOME/.dotfiles/rofi/themes /usr/share/rofi/
        else
            cp -v -r ./rofi/themes $HOME/.dotfiles/rofi/
            ln -sf $HOME/.dotfiles/rofi/themes /usr/share/rofi/
        fi
    else
        printf "Rofi is not installed\n"
    fi

    if [[ -e $HOME/.bashrc ]]; then
        printf ".bashrc file found in $HOME creating backup copy of it in $HOME/PREVIOUS_CONFIG_BACKUP\n"
        mkdir -p $HOME/PREVIOUS_CONFIG_BACKUP/bash
        mv -v $HOME/.bashrc $HOME/PREVIOUS_CONFIG_BACKUP/bash/
        mkdir -v -p $HOME/.dotfiles/bash
        cp -v -r ./bash/* $HOME/.dotfiles/bash/
        ln -v -sf $HOME/.dotfiles/bash/.bashrc $HOME/
        if [[ -e $HOME/.bash_aliases ]]; then
            printf ".bash_aliases file found in $HOME creating backup copy of it in $HOME/PREVIOUS_CONFIG_BACKUP\n"
            mv -v $HOME/.bash_aliases $HOME/PREVIOUS_CONFIG_BACKUP/bash/
        else
            ln -v -sf $HOME/.dotfiles/bash/.bash_aliases $HOME/
        fi
        if [[ -e $HOME/.bash_functions ]]; then
            printf ".bash_functions file found in $HOME creating backup copy of it in $HOME/PREVIOUS_CONFIG_BACKUP\n"
            mv -v $HOME/.bash_functions $HOME/PREVIOUS_CONFIG_BACKUP/bash/
        else
            ln -v -sf $HOME/.dotfiles/bash/.bash_functions $HOME/
        fi
    else
        printf ".bashrc doesn't exists, do you wish to copy the dotfiles .bashrc file?\n"
    fi

    echo -n "Do you whish to import the .gitconfig file? (y/n)? "
    old_stty_cfg=$(stty -g)
    stty raw -echo
    answer=$( while ! head -c 1 | grep -i '[ny]' ;do true ;done )
    stty $old_stty_cfg
    if echo "$answer" | grep -iq "^y" ;then
        if [[ -e $HOME/.gitconfig ]]; then
            printf ".gitconfig file found in $HOME creating backup copy of it in $HOME/PREVIOUS_CONFIG_BACKUP\n"
            mv -v $HOME/.gitconfig $HOME/PREVIOUS_CONFIG_BACKUP/
            cp -v -r ./.gitconfig $HOME/.dotfiles/
            ln -v -sf $HOME/.dotfiles/.gitconfig $HOME/
        else
            printf ".gitconfig file was not found in $HOME skipping...\n"
        fi
    else
        printf "cleaning\n"
    fi

    echo -n "Do you wanna create a git repo to monitore the $HOME/.dotfiles folder (y/n)? "
    old_stty_cfg=$(stty -g)
    stty raw -echo
    answer=$( while ! head -c 1 | grep -i '[ny]' ;do true ;done )
    stty $old_stty_cfg
    if echo "$answer" | grep -iq "^y" ;then
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
            echo -n "Do you have created the repository (y/n)? "
            old_stty_cfg=$(stty -g)
            stty raw -echo
            answer=$( while ! head -c 1 | grep -i '[ny]' ;do true ;done )
            stty $old_stty_cfg
            if echo "$answer" | grep -iq "^y" ;then
                cd $HOME/.dotfiles/
                printf "Please insert the github repository URL: "
                initgit
                cd $HOME
            else
                printf "exiting\n"
            fi
        fi
    else
        printf "aborting\n"
    fi

    printf "INSTALLATION DONE\nREMAINDERS:\nNow open your \e[32m\e[3mVIM\e[23m\e[0m and run \e[33m:PlugInstall\e[0m to install the plugins\n"
}

printf "\e[1m\e[33mWARNING
\e[31mTHE FOLLOWING SCRIPT WILL INSTALL ALL THE CONFIGURATIONS AUTOMATIC
PLEASE ENSURE THAT YOU HAVE THE FOLLOWING PACKAGES INSTALLED:
\e[32mPicom \e[35m[Ibhagwan Fork]\e[34m(https://github.com/ibhagwan/picom)
\e[32mi3wm\e[34m (https://github.com/i3/i3)
\e[32mNeofetch\e[34m (https://github.com/dylanaraps/neofetch)
\e[32mPolybar\e[34m (https://github.com/polybar/polybar)
\e[32mRofi\e[34m (https://github.com/davatorium/rofi)
\e[32mRofi Applets\e[34m (https://github.com/adi1090x/rofi)
\e[32mTerminator\e[34m (https://github.com/gnome-terminator/terminator)
\e[32mVim\e[34m (https://github.com/vim/vim)

\e[33mTHIS SCRIPT WILL CREATE A FOLDER INSIDE THE \e[36m\$HOME \e[34m($HOME)\e[33m DIRECTIORY CALLED \e[36m.dotfiles\e[33m
AND THEN WILL CREATE SYMLINKS FROM THAT DIRECTORY TO THE ORIGINAL CONFIG FILES.
\e[21m\e[0m\n"

echo -n "Do you have these packages installed (y/n)? "
old_stty_cfg=$(stty -g)
stty raw -echo
answer=$( while ! head -c 1 | grep -i '[ny]' ;do true ;done )
stty $old_stty_cfg
if echo "$answer" | grep -iq "^y" ;then
    doinstall
else
    printf "\e[31mABORTING\e[0m\n"
fi