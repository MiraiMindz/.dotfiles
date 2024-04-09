#!/usr/bin/env zsh

# VARIABLES

PROGRAMMING_PROJECTS="$HOME/usr/Programming/Projects"
PROGRAMMING_COURSES="$HOME/usr/Programming/Courses"
DOTFILES="$HOME/etc/dotfiles.d"

# ALIASES
alias nv=nvim
alias claer=clear
alias cler=clear
alias clar=clear
alias cls=clear

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

function project_creator() {
    declare -a options
    options=(
        "[LANGUAGE] C"
        "[LANGUAGE] Assembly"
        "[LANGUAGE] Python"
        "[LANGUAGE] Rust"
        "[LANGUAGE] Go"
        "[LANGUAGE] Lua"
        "[LANGUAGE] Java"
        "[LANGUAGE] Shell"
        "[FRAMEWORK] NextJS"
        "[FRAMEWORK] SolidJS"
        "[FRAMEWORK] Svelt"
        "[FRAMEWORK] Angular"
        "[FRAMEWORK] Spring"
        "[PROJECT] ToyOS"
        "[PROJECT] FullStackApp"
    )
    
    answer=$(printf "%s\n" "${options[@]}" | fzf)
    result=$(echo $answer | cut -d' ' -f2)
    if [[ ! -d $PROGRAMMING_PROJECTS ]]; then
        mkdir -p $PROGRAMMING_PROJECTS
    fi

    case $result in
        "C")
            echo "C";
        ;;
        "Assembly")
            echo "ASM";
        ;;
        "Python")
            echo "Python";
        ;;
        "Rust")
            echo "Rust";
        ;;
        "Go")
            echo "Go";
        ;;
        "Lua")
            echo "Lua";
        ;;
        "Java")
            echo "Java";
        ;;
        "Shell")
            echo "Shell";
        ;;
        "NextJS")
            echo "NextJS";
        ;;
        "SolidJS")
            echo "SolidJS";
        ;;
        "Svelt")
            echo "Svelt";
        ;;
        "Angular")
            echo "Angular";
        ;;
        "Spring")
            echo "SpringBoot";
        ;;
        "ToyOS")
            echo "Toy OS";
        ;;
        "FullStackApp")
            echo "Full Stack App";
        ;;

        *)
            printf "%s\n" "Unknown Option, doing nothing."
        ;;
    esac

}

