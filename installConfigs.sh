#!/usr/bin/env bash

# Bruh, I will re-do this when I stop making critical changes to these files

# ### Text Styles
# DARK_BLACK='\e[30m'
# DARK_RED='\e[31m'
# DARK_GREEN='\e[32m'
# DARK_YELLOW='\e[33m'
# DARK_BLUE='\e[34m'
# DARK_PURPLE='\e[35m'
# DARK_CYAN='\e[36m'
# DARK_WHITE='\e[37m'
# LIGHT_BLACK='\e[90m'
# LIGHT_RED='\e[91m'
# LIGHT_GREEN='\e[92m'
# LIGHT_YELLOW='\e[93m'
# LIGHT_BLUE='\e[94m'
# LIGHT_PURPLE='\e[95m'
# LIGHT_CYAN='\e[96m'
# LIGHT_WHITE='\e[97m'
# TEXTBOLD_ON='\e[1m'
# TEXTFAINT_ON='\e[2m'
# TEXTITALIC_ON='\e[3m'
# TEXTUNDERLN_ON='\e[4m'
# TEXTBLINK_ON='\e[5m'
# TEXTHIGHLT_ON='\e[7m'
# TEXTHIDDEN_ON='\e[8m'
# TEXTSTRIKE_ON='\e[9m'
# TEXTBOLD_OFF='\e[21m'
# TEXTFAINT_OFF='\e[22m'
# TEXTITALIC_OFF='\e[23m'
# TEXTUNDERLN_OFF='\e[24m'
# TEXTBLINK_OFF='\e[25m'
# TEXTHIGHLT_OFF='\e[27m'
# TEXTHIDDEN_OFF='\e[28m'
# TEXTSTRIKE_OFF='\e[29m'
# NOCOLOR='\e[39m'
# TEXTRESETALL='\e[m'

# BACKUPFOLDER=$HOME/old_config_backup
# DOTFILESDIR=$HOME/.dotfiles

# ### Functions

# mkbkp() {
#     mkdir -v -p $1
#     mv -v $2/* $1/
#     printf "%s\n" "Backup done, proceeding with Installation."
# }

# initgit() {
#     if [[ -e $(which gh) ]]; then
#         printf "%s\n" "Github CLI is installed: $(which gh)"
#         cd $DOTFILESDIR/
#         git init -b main
#         git add .
#         git commit -m "created .dotfiles repo from script"
#         gh repo create
#         cd $HOME
#     else
#         printf "%s\n" "Github CLI was not found, please create a Github repository and come back to this script"
#         echo -e -n "Do you have created the repository (${DARK_GREEN}y${NOCOLOR}/${DARK_RED}n${NOCOLOR})? "
#         old_stty_cfg=$(stty -g)
#         stty raw -echo
#         answer=$( while ! head -c 1 | grep -i '[ny]' ;do true ;done )
#         stty $old_stty_cfg
#         if echo "$answer" | grep -iq "^y" ;then
#             cd $DOTFILESDIR/
#             git init -b main
#             git add .
#             git commit -m "created .dotfiles repo from script"
#             printf "%s" "Please insert the github repository URL: "
#             git remote add origin
#             git remote -v && git push
#             cd $HOME
#         else
#             printf "%s\n" "${DARK_RED}Exiting${NOCOLOR}"
#         fi
#     fi
# }

# createDotfiles_BackupDir() {
#     if [[ -d $BACKUPFOLDER ]]; then
#         printf "%s\n" "${DARK_BLUE}$BACKUPFOLDER${NOCOLOR} Directory Already Exists"
#         mkdir $HOME/old_config_backup2
#         mv -v BACKUPFOLDER/* $HOME/old_config_backup2
#     else
#         printf "%s\n" "Creating ${DARK_BLUE}$BACKUPFOLDER${NOCOLOR} Directory"
#         mkdir $BACKUPFOLDER/
#     fi
#     if [[ -d $HOME/.dotfiles ]];  then
#         printf "%s\n" "${DARK_BLUE}$DOTFILESDIR${NOCOLOR} Directory Already Exists"
#         printf "%s\n" "Backing up"
#         mv -v $DOTFILESDIR/* $BACKUPFOLDER/
#         mv -v * $DOTFILESDIR/
#     else
#         printf "%s\n" "Creating ${DARK_BLUE}$DOTFILESDIR${NOCOLOR} Directory"
#         mkdir $DOTFILESDIR
#         mv -v * $DOTFILESDIR/
#     fi
# }

# installI3WM() {
#     if [[ -e $(which i3) ]]; then
#         printf "%s\n" "${DARK_GREEN}INSTALLING${NOCOLOR} I3wm Config"
#         if [[ -d $HOME/.config/i3 ]]; then
#             printf "%s\n" "i3 config found, creating backup in $BACKUPFOLDER/"
#             mkbkp $BACKUPFOLDER/i3wm $HOME/.config/i3
#             rmdir $HOME/.config/i3
#             ln -v -sf $HOME/.dotfiles/environment/i3wm $HOME/.config/i3
#         else
#             rmdir $HOME/.config/i3
#             ln -v -sf $HOME/.dotfiles/environment/i3wm $HOME/.config/i3
#         fi
#     fi
# }

# installPicom() {
#     if [[ -e $(which picom) ]]; then
#         printf "%s\n" "${DARK_GREEN}INSTALLING${NOCOLOR} Picom Config"
#         if [[ -d $HOME/.config/picom ]]; then
#             printf "%s\n" "picom config found, creating backup in $BACKUPFOLDER/"
#             mkbkp $BACKUPFOLDER/picom $HOME/.config/picom
#             rmdir $HOME/.config/picom
#             ln -v -sf $HOME/.dotfiles/environment/picom $HOME/.config/
#         else
#             rmdir $HOME/.config/picom
#             ln -v -sf $HOME/.dotfiles/environment/picom $HOME/.config/
#         fi
#     fi
# }

# installPolybar() {
#     if [[ -e $(which polybar) ]]; then
#         printf "%s\n" "${DARK_GREEN}INSTALLING${NOCOLOR} Polybar Config"
#         if [[ -e $HOME/.config/polybar ]]; then
#             printf "%s\n" "polybar config found, creating backup in $BACKUPFOLDER/"
#             mkbkp $BACKUPFOLDER/polybar $HOME/.config/polybar
#             rmdir $HOME/.config/polybar
#             ln -v -sf $HOME/.dotfiles/environment/polybar $HOME/.config/
#         else
#             rmdir $HOME/.config/polybar
#             ln -v -sf $HOME/.dotfiles/environment/polybar $HOME/.config/
#         fi
#     fi
# }

# installTerminator() {
#     if [[ -e $(which terminator) ]]; then
#         printf "%s\n" "${DARK_GREEN}INSTALLING${NOCOLOR} Terminator Config"
#         if [[ -d $HOME/.config/terminator ]]; then
#             printf "%s\n" "terminator config found, creating backup in $BACKUPFOLDER/"
#             mkbkp $BACKUPFOLDER/terminator $HOME/.config/terminator
#             rmdir $HOME/.config/terminator
#             ln -v -sf $HOME/.dotfiles/environment/terminator $HOME/.config/
#         else
#             rmdir $HOME/.config/terminator
#             ln -v -sf $HOME/.dotfiles/environment/terminator $HOME/.config/
#         fi
#     fi
# }



# installNeofetch() {
#     if [[ -e $(which neofetch) ]];then
#         printf "%s\n" "${DARK_GREEN}INSTALLING${NOCOLOR} Neofetch Config"
#         if [[ -d $HOME/.config/neofetch ]]; then
#             printf "%s\n" "neofetch config found, creating backup in $BACKUPFOLDER"
#             mkbkp $BACKUPFOLDER/neofetch $HOME/.config/neofetch
#             rmdir $HOME/.config/neofetch
#             ln -sf $HOME/.dotfiles/neofetch $HOME/.config/
#         else
#             rmdir $HOME/.config/neofetch
#             ln -sf $HOME/.config/neofetch $HOME/.config/
#         fi
#     fi
# }

# installVIM() {
#     if [[ -e $(which vim) ]]; then
#         printf "%s\n" "${DARK_GREEN}INSTALLING${NOCOLOR} VIM Config"
#         if [[ -e $HOME/.vim ]]; then
#             mkbkp $BACKUPFOLDER/vim $HOME/.vim
#             rm -v $HOME/.vim
#             rm -v $HOME/.dotfiles/editors/vim/.vim/plugins
#             ln -sf $HOME/.dotfiles/editors/vim-nvim-commons/plugins $HOME/.dotfiles/editors/vim/.vim/
#             ln -sf $HOME/.dotfiles/editors/vim/.vim $HOME/
#         else
#             rm -v $HOME/.vim
#             rm -v $HOME/.dotfiles/editors/vim/.vim/plugins
#             ln -sf $HOME/.dotfiles/editors/vim-nvim-commons/plugins $HOME/.dotfiles/editors/vim/.vim/
#             ln -sf $HOME/.dotfiles/editors/vim/.vim $HOME/
#         fi
#         if [[ -e $HOME/vimfiles ]]; then
#             mkbkp $BACKUPFOLDER/vim/vimfiles $HOME/vimfiles
#             rm -v $HOME/vimfiles
#             rm $HOME/.dotfiles/editors/vim/vimfiles/*
#             ln -sf $HOME/.dotfiles/editors/vim-nvim-commons/* $HOME/.dotfiles/editors/vim/vimfiles/
#             ln -sf $HOME/.dotfiles/editors/vim/vimfiles $HOME/
#         else
#             rm -v $HOME/vimfiles
#             rm $HOME/.dotfiles/editors/vim/vimfiles/*
#             ln -sf $HOME/.dotfiles/editors/vim-nvim-commons/* $HOME/.dotfiles/editors/vim/vimfiles/
#             ln -sf $HOME/.dotfiles/editors/vim/vimfiles $HOME/
#         fi
#         if [[ -e $HOME/.vimrc ]]; then
#             mv -v $HOME/.vimrc $BACKUPFOLDER/vim/
#             ln -sf $HOME/.dotfiles/editors/vim/.vimrc $HOME/
#         else
#             ln -sf $HOME/.dotfiles/editors/vim/.vimrc $HOME/
#         fi
#     fi
# }

# installNeoVIM() {
#     if [[ -e $(which neovim) ]]; then
#         printf "%s\n" "${DARK_GREEN}INSTALLING${NOCOLOR} NeoVIM Config"
#         if [[ -e $HOME/.config/nvim ]]; then
#             mkbkp $BACKUPFOLDER/neovim $HOME/.config/nvim
#             rm -v $HOME/.config/nvim
#             rm -v $HOME/.dotfiles/editors/nvim/plugins
#             ln -sf $HOME/.dotfiles/editors/vim-nvim-commons/plugins $HOME/.dotfiles/editors/nvim/
#             ln -sf $HOME/.dotfiles/editors/nvim $HOME/.config/
#         else
#             rm -v $HOME/.config/nvim
#             rm -v $HOME/.dotfiles/editors/nvim/plugins
#             ln -sf $HOME/.dotfiles/editors/vim-nvim-commons/plugins $HOME/.dotfiles/editors/nvim/
#             ln -sf $HOME/.dotfiles/editors/nvim $HOME/.config/
#         fi
#         if [[ -d $HOME/.dotfiles/editors/nvim/nvimfiles ]]; then
#             rm $HOME/.dotfiles/editors/nvim/nvimfiles/*
#             ln -sf $HOME/.dotfiles/editors/vim-nvim-commons/* $HOME/.dotfiles/editors/nvim/nvimfiles/
#         else
#             mkdir $HOME/.dotfiles/editors/nvim/nvimfiles
#             ln -sf $HOME/.dotfiles/editors/vim-nvim-commons/* $HOME/.dotfiles/editors/nvim/nvimfiles/
#         fi
#     fi
# }

# installVI() {
#     if [[ -e $(which vi) ]]; then
#         printf "%s\n" "${DARK_GREEN}INSTALLING${NOCOLOR} VI Config"
#         if [[ -e $HOME/.exrc ]]; then
#             mkdir $BACKUPFOLDER/vi
#             mv -v $HOME/.exrc $BACKUPFOLDER/vi/
#             rm -v $HOME/.exrc
#             ln -sf $HOME/.dotfiles/editors/vi/.exrc
#         else
#             ln -sf $HOME/.dotfiles/editors/vi/.exrc
#         fi
#     fi
# }

# #################### TODO: BASH/ZSH Configs
# # installBash() {
# #     echo -e -n "Do you want to import the bash configs (${DARK_GREEN}y${NOCOLOR}/${DARK_RED}n${NOCOLOR})? "
# #     old_stty_cfg=$(stty -g)
# #     stty raw -echo
# #     answer=$( while ! head -c 1 | grep -i '[ny]' ;do true ;done )
# #     stty $old_stty_cfg
# #     if echo "$answer" | grep -iq "^y" ;then
# #         printf "%s\n" "${DARK_GREEN}INSTALLING${NOCOLOR} Bash Config"
# #         if [[ -e $HOME/.bash ]]; then
# #             mkbkp $BACKUPFOLDER/bash $HOME/.bash
# #             rmdir $HOME/.bash
# #             mkdir $HOME/.bash
# #             ln -sf $HOME/.dotfiles/bash/* $HOME/.bash/
# #             unlink $HOME/.bash/.bashrc
# #         else
# #             ln -sf $HOME/.dotfiles/bash $HOME/.bash
# #         fi
# #         if [[ -e $HOME/.bashrc ]]; then
# #             mv -v $HOME/.bashrc $BACKUPFOLDER/bash/
# #             rm $HOME/.bashrc
# #             ln -sf $HOME/.dotfiles/bash/.bashrc $HOME/.bashrc
# #         else
# #             ln -sf $HOME/.dotfiles/bash/.bashrc $HOME/.bashrc
# #         fi
# #     else
# #         printf "%s\n" "${DARK_RED}PASSING${NOCOLOR}"
# #     fi
# # }
# ####################

# installRofi() {
#     if [[ -e $(which rofi) ]]; then
#         printf "${DARK_GREEN}INSTALLING${NOCOLOR} Rofi Config\n"
#         if [[ -d /usr/share/rofi/themes ]];
#             printf "%s\n" "the rofi themes resides in the ${DARK_YELLOW}/usr${NOCOLOR} folder, to install these themes we will need the sudo permission"
#             sudo rmdir /usr/share/rofi/themes
#             sudo ln -sf $HOME/.dotfiles/environment/rofi/themes /usr/share/rofi/
#         else
#             sudo ln -sf $HOME/.dotfiles/environment/rofi/themes /usr/share/rofi/
#         fi
#     fi
# }

# installRofiApplets() {
#     if [[ -d $HOME/.config/rofi ]]; then
#         printf "%s\n" "${DARK_GREEN}INSTALLING${NOCOLOR} Rofi Applets Config"
#         rm -rf $HOME/.config/rofi/*
#         ln -sf $HOME/.dotfiles/environment/rofi/applets $HOME/.config/rofi/
#         ln -sf $HOME/.dotfiles/environment/rofi/bin $HOME/.config/rofi/
#         ln -sf $HOME/.dotfiles/environment/rofi/launchers $HOME/.config/rofi/
#         ln -sf $HOME/.dotfiles/environment/rofi/powermenu $HOME/.config/rofi/
#         ln -sf $HOME/.dotfiles/environment/rofi/config.rasi $HOME/.config/rofi/
#     fi
# }

# installCoolRetroTerm() {
#     if [[ -e $(which cool-retro-term) ]]; then
#         printf "%s\n" "${DARK_GREEN}INSTALLING${NOCOLOR} cool-retro-term Theme"
#         if [[ -e /usr/lib/qt/qml/QMLTermWidget/color-schemes/cool-retro-term.colorscheme ]]; then
#             sudo rm /usr/lib/qt/qml/QMLTermWidget/color-schemes/cool-retro-term.colorscheme
#             printf "Please select one of these themes:\n"
#             printf "%s\n" "0. Default"
#             printf "%s\n" "1. Dracula"
#             printf "%s\n" "2. MaterialOcean"
#             printf "%s\n" "3. Nord"
#             read -e -p "Enter the number: " CHOICE
#             case $CHOICE in
#             "0" | 0)
#             sudo ln -sf $HOME/.dotfiles/terminals/cool-retro-term/Themes/default.colorscheme /usr/lib/qt/qml/QMLTermWidget/color-schemes/cool-retro-term.colorscheme
#             ;;
#             "1" | 1)
#             sudo ln -sf $HOME/.dotfiles/terminals/cool-retro-term/Themes/Dracula.colorscheme /usr/lib/qt/qml/QMLTermWidget/color-schemes/cool-retro-term.colorscheme
#             ;;
#             "2" | 2)
#             sudo ln -sf $HOME/.dotfiles/terminals/cool-retro-term/Themes/MaterialThemeOcean.colorscheme /usr/lib/qt/qml/QMLTermWidget/color-schemes/cool-retro-term.colorscheme
#             ;;
#             "3" | 3)
#             sudo ln -sf $HOME/.dotfiles/terminals/cool-retro-term/Themes/Nord.colorscheme /usr/lib/qt/qml/QMLTermWidget/color-schemes/cool-retro-term.colorscheme
#             ;;
#             *)
#             printf "Invalid input, try again\n"
#             ;;
#             esac
#         fi
#         printf "%s\n" "If you want another theme, run the changeTheme script in ${DARK_YELLOW}$HOME/.dotfiles/terminals/cool-retro-term/${NOCOLOR}"
#         printf "%s\n" "Or if you want you can read the readme.md in ${DARK_YELLOW}$HOME/.dotfiles/terminals/cool-retro-term/${NOCOLOR} or in ${DARK_BLUE}https://github.com/MiraiMindz/.dotfiles/tree/main/terminals/cool-retro-term#readme${NOCOLOR}"
#     fi
# }

# installSDDMTheme() {
#     if [[ -e $(which sddm) ]]; then
#         if [[ -d /usr/share/sddm/themes/Sugar-Candy ]]; then
#             printf "${DARK_GREEN}INSTALLING${NOCOLOR} SDDM Sugar Candy Theme Config\n"
#             sudo mv -v $HOME/.dotfiles/environment/sddm/Themes/Wallpapers/* /usr/share/sddm/themes/Sugar-Candy/Backgrounds/
#             sudo ln -sf /usr/share/sddm/themes/Sugar-Candy/* $HOME/.dotfiles/environment/sddm/Themes/SugarCandy/
#             sudo mkdir /etc/sddm.conf.d
#             sudo ln -sf $HOME/.dotfiles/environment/sddm/config.conf /etc/sddm.conf.d/
#         else
#             printf "%s\n" "Install the Sugar Candy Theme ${DARK_BLUE} (https://github.com/Kangie/sddm-sugar-candy)${NOCOLOR}"
#             printf "%s\n" "And run the following commands"
#             printf "%s\n" "${DARK_YELLOW}sudo mv -v \$HOME/.dotfiles/environment/sddm/Themes/Wallpapers/* /usr/share/sddm/themes/Sugar-Candy/Backgrounds/${NOCOLOR}"
#             printf "%s\n" "${DARK_YELLOW}sudo ln -sf /usr/share/sddm/themes/Sugar-Candy/* \$HOME/.dotfiles/environment/sddm/Themes/SugarCandy/${NOCOLOR}"
#             printf "%s\n" "${DARK_YELLOW}sudo mkdir /etc/sddm.conf.d${NOCOLOR}"
#             printf "%s\n" "${DARK_YELLOW}sudo ln -sf \$HOME/.dotfiles/environment/sddm/config.conf /etc/sddm.conf.d/${NOCOLOR}"
#         fi
#     fi
# }

# checkPackages() {
#     _checkPkgs() {
#         if [[ -e $(which $1) ]]; then
#             printf "%s\n" "$1 is ${DARK_GREEN}INSTALLED${NOCOLOR}"
#         else
#             printf "%s\n" "$1 is ${DARK_RED}MISSING${NOCOLOR}"
#         fi
#     }
#     _checkPkgs "bash"
#     _checkPkgs "zsh"
#     _checkPkgs "i3"
#     _checkPkgs "picom"
#     _checkPkgs "polybar"
#     _checkPkgs "terminator"
#     _checkPkgs "cool-retro-term"
#     _checkPkgs "neofetch"
#     _checkPkgs "vim"
#     _checkPkgs "neovim"
#     _checkPkgs "vi"
#     _checkPkgs "rofi"
#     if [[ -d $HOME/.config/rofi ]]; then
#         printf "%s\n" "Rofi Applets is ${DARK_GREEN}INSTALLED${NOCOLOR}"
#     else
#         printf "%s\n" "Rofi Applets is ${DARK_RED}MISSING${NOCOLOR}"
#     fi
#     _checkPkgs "sddm"
#     if [[ -d /usr/share/sddm/themes/Sugar-Candy ]]; then
#         printf "%s\n" "SDDM Sugar Candy Theme is ${DARK_GREEN}INSTALLED${NOCOLOR}"
#     else
#         printf "%s\n" "SDDM Sugar Candy Theme is ${DARK_RED}MISSING${NOCOLOR}"
#     fi
# }

# doinstall() {
#     clear
#     printf "%s\n" "${DARK_YELLOW}CKECKING FOR PACKAGES${TEXTRESETALL}"
#     checkPackages
#     printf "%s\n" "${DARK_YELLOW}CHECKING COMPLETE, PROCEEDING WITH INSTALLATION${TEXTRESETALL}"
#     createDotfiles_BackupDir
#     installI3WM
#     installPicom
#     installPolybar
#     installTerminator
#     installCoolRetroTerm
#     installNeofetch
#     installVIM
#     installNeoVIM
#     installVI
#     installBash
#     installZSH
#     installRofi
#     installRofiApplets
#     echo -e -n "Do you want to create a git repository on the ${DARK_YELLOW}$HOME/.dotfiles${NOCOLOR} directory (${DARK_GREEN}y${NOCOLOR}/${DARK_RED}n${NOCOLOR})? "
#     old_stty_cfg=$(stty -g)
#     stty raw -echo
#     answer=$( while ! head -c 1 | grep -i '[ny]' ;do true ;done )
#     stty $old_stty_cfg
#     if echo "$answer" | grep -iq "^y" ;then
#         printf "%s\n" "${DARK_GREEN}INITIALIZING GIT${NOCOLOR}"
#         initgit
#     else
#         printf "%s\n" "${DARK_RED}PROCEEDING${NOCOLOR}"
#     fi

#     printf "%s\n" "INSTALLATION ${DARK_GREEN}DONE${NOCOLOR}"
# }

# ### Installation

# clear
# ln0="WARNING"
# ln1="THE FOLLOWING SCRIPT WILL INSTALL ALL THE CONFIGURATIONS AUTOMATIC"
# ln2="PLEASE ENSURE THAT YOU HAVE THE FOLLOWING PACKAGES INSTALLED."
# shopt -s checkwinsize; (:;:)
# printf %"$COLUMNS"s |tr " " "="
# printf "${TEXTBOLD_ON}${DARK_YELLOW}%*s${TEXTRESETALL}\n" $(((${#ln0}+$COLUMNS)/2)) "$ln0"
# printf "${TEXTBOLD_ON}${DARK_RED}%*s${TEXTRESETALL}\n" $(((${#ln1}+$COLUMNS)/2)) "$ln1"
# printf "${TEXTBOLD_ON}${DARK_RED}%*s${TEXTRESETALL}\n" $(((${#ln2}+$COLUMNS)/2)) "$ln2"
# printf %"$COLUMNS"s |tr " " "="

# printf "%s\n" "${DARK_GREEN}Picom ${DARK_PURPLE}[Ibhagwan Fork]${DARK_BLUE}(https://github.com/ibhagwan/picom)${NOCOLOR}"
# printf "%s\n" "${DARK_GREEN}i3wm${DARK_BLUE} (https://github.com/Airblader/i3)${NOCOLOR}"
# printf "%s\n" "${DARK_GREEN}Neofetch${DARK_BLUE} (https://github.com/dylanaraps/neofetch)${NOCOLOR}"
# printf "%s\n" "${DARK_GREEN}Polybar${DARK_BLUE} (https://github.com/polybar/polybar)${NOCOLOR}"
# printf "%s\n" "${DARK_GREEN}Rofi${DARK_BLUE} (https://github.com/davatorium/rofi)${NOCOLOR}"
# printf "%s\n" "${DARK_GREEN}Rofi Applets${DARK_BLUE} (https://github.com/adi1090x/rofi)${NOCOLOR}"
# printf "%s\n" "${DARK_GREEN}Terminator${DARK_BLUE} (https://github.com/gnome-terminator/terminator)${NOCOLOR}"
# printf "%s\n" "${DARK_GREEN}Cool Retro Term${DARK_BLUE} (https://github.com/Swordfish90/cool-retro-term)${NOCOLOR}"
# printf "%s\n" "${DARK_GREEN}Vim${DARK_BLUE} (https://github.com/vim/vim)${NOCOLOR}"
# printf "%s\n" "${DARK_GREEN}SDDM ${DARK_BLUE}(https://github.com/sddm/sddm)${NOCOLOR}"
# printf "%s\n" "${DARK_GREEN}SDDM Sugar Candy${DARK_BLUE} (https://github.com/Kangie/sddm-sugar-candy)${NOCOLOR}"

# printf "%s\n" "${DARK_YELLOW}THIS SCRIPT WILL CREATE A FOLDER INSIDE THE ${DARK_CYAN}\$HOME ${DARK_BLUE}($HOME)${DARK_YELLOW} DIRECTIORY CALLED ${DARK_CYAN}.dotfiles${DARK_YELLOW}\nAND THEN WILL CREATE SYMLINKS FROM THAT DIRECTORY TO THE ORIGINAL CONFIG FILES."
# printf "%s\n" "IF ANY CONFIGURATION IS FOUND IT WILL BE BACKED UP IN A CREATED FOLDER ${DARK_BLUE}($BACKUPFOLDER/)${DARK_YELLOW}${TEXTRESETALL}\n"

# echo -e -n "Do you have these packages installed (${DARK_GREEN}y${NOCOLOR}/${DARK_RED}n${NOCOLOR})? "
# old_stty_cfg=$(stty -g)
# stty raw -echo
# answer=$( while ! head -c 1 | grep -i '[ny]' ;do true ;done )
# stty $old_stty_cfg
# if echo "$answer" | grep -iq "^y" ;then
#     printf "%s\n" "${DARK_GREEN}INSTALLING${TEXTRESETALL}"
#     doinstall
# else
#     printf "%s\n" "${DARK_RED}ABORTING${TEXTRESETALL}"
# fi

