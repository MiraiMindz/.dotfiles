#!/usr/bin/env zsh

cd "$1"

if [[ -e $(command -v nvim) ]]; then
    nvim .
elif [[ -e $(command -v vim) ]]; then
    vim . 
else
    printf "Terminal Based Editor Not Found\n"
fi

