#!/usr/bin/env zsh

# VARIABLES

PROGRAMMING_PROJECTS="$HOME/usr/Programming/Projects"
PROGRAMMING_COURSES="$HOME/usr/Programming/Courses"
DOTFILES="$HOME/etc/dotfiles.d"

# ALIASES
alias nv=nvim

# HELPER FUNCTIONS
function edit_dotfiles() {
    if [[ ! $(command -v git) ]]; then
        echo "Git not installed"
    fi

    curr_dir=$(pwd)
    commit_msg="Automatic commit @[$(date +%d/%m/%Y\ %H:%M:%S.%N)]"

    cd $DOTFILES
    nvim
    git add .
    git commit -m "$commit_msg"
    git push
    cd $curr_dir
}

