#!/usr/bin/env zsh

if [[ ! -d "$HOME/etc" ]]; then
    export DOTFILES="$HOME/.dotfiles"
else
    export DOTFILES="$HOME/etc/dotfiles.d"
fi

if [[ ! -d "/media/Arquivos" ]]; then
    if [[ ! -d "$HOME/media" ]]; then
        FILES="$HOME/Arquivos"
    else
        FILES="$HOME/media/Arquivos"
    fi
else
    FILES="/media/Arquivos"
fi


ARQUIVOS=$FILES
PROGRAMMING="$FILES/Programming"

# User Custom XDG Dirs
USR_BASE_DIR="$HOME/usr"
USR_DOCUMENTS="$USR_BASE_DIR/Documents"
USR_DOWNLOADS="$USR_BASE_DIR/Downloads"
USR_IMAGES="$USR_BASE_DIR/Images"
USR_VIDEOS="$USR_BASE_DIR/Videos"
USR_TORRENTS="$USR_BASE_DIR/Torrents"
USR_WALLPAPERS="$USR_BASE_DIR/Wallpapers"
USER_BASE_DIR="$USR_BASE_DIR"
USER_DOCUMENTS="$USR_DOCUMENTS"
USER_DOWNLOADS="$USR_DOWNLOADS"
USER_IMAGES="$USR_IMAGES"
USER_VIDEOS="$USR_VIDEOS"
USER_TORRENTS="$USR_TORRENTS"
USER_WALLPAPERS="$USR_WALLPAPERS"
WINE_FOLDERS="$USR_BASE_DIR/WineFolders"
DOCUMENTS="$USR_DOCUMENTS"
DOWNLOADS="$USR_DOWNLOADS"
IMAGES="$USR_IMAGES"
VIDEOS="$USR_VIDEOS"
WALLPAPERS="$USR_WALLPAPERS"
TORRENTS="$USR_TORRENTS"

# Exports

export PROGRAMMING_PROJECTS="$PROGRAMMING/Projects"
export FZF_DEFAULT_OPTS=" \
--color=bg+:#313244,bg:#1e1e2e,spinner:#f5e0dc,hl:#f38ba8 \
--color=fg:#cdd6f4,header:#f38ba8,info:#cba6f7,pointer:#f5e0dc \
--color=marker:#f5e0dc,fg+:#cdd6f4,prompt:#cba6f7,hl+:#f38ba8 \
--tabstop=4 --layout=reverse --border --preview-window=wrap"

