#!/usr/bin/env zsh

export DOTFILES="$HOME/.dotfiles"
FILES="$HOME/Arquivos"
ARQUIVOS=$FILES
PROGRAMMING="$FILES/Programming"
export PROGRAMMING_PROJECTS="$PROGRAMMING/Projects"

# Exports

export FZF_DEFAULT_OPTS=" \
--color=bg+:#313244,bg:#1e1e2e,spinner:#f5e0dc,hl:#f38ba8 \
--color=fg:#cdd6f4,header:#f38ba8,info:#cba6f7,pointer:#f5e0dc \
--color=marker:#f5e0dc,fg+:#cdd6f4,prompt:#cba6f7,hl+:#f38ba8 \
--tabstop=4 --layout=reverse --border --preview-window=wrap"
