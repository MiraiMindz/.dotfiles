#!/usr/bin/env zsh

clear
read -n 1 -p "Would you like to publish the Git repository on GitHub (y/n)? " answer
if [ "$answer" != "${answer#[Yy]}" ];then
    if [[ -e $(command -v gh) ]]; then                    
        clear
        read -n 1 -p "Is your repo public (y/n)? " repoView
        if [ "$repoView" != "${repoView#[Yy]}" ]; then
            gh repo create "$1" --public --source=.
        else
            gh repo create "$1" --private --source=.
        fi
        git branch -M main
        git push -u origin main
    else
        printf "GitHub CLI not found initializing local repository only.\n"
    fi
fi

