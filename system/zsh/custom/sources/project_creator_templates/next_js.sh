#!/usr/bin/env zsh

if [[ ! -e $(command -v npx) ]]; then
    printf "NPX Command not found please install it\n"
    return
fi

HELPER_FUNCTIONS=$DOTFILES/system/zsh/custom/sources/project_creator_templates

cd $PROGRAMMING_PROJECTS
read -p "Enter Project Name: " projectName
npx create-next-app@latest $projectName
cd $projectName
sh $HELPER_FUNCTIONS/_push_to_github.sh $projectName
clear
sh $HELPER_FUNCTIONS/_open_editor.sh $projectFolder


