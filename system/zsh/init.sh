#!/usr/bin/env zsh

# VARIABLES

PROGRAMMING_PROJECTS="$HOME/usr/Programming/Projects"
PROGRAMMING_COURSES="$HOME/usr/Programming/Courses"
DOTFILES="$HOME/etc/dotfiles.d"
local _programming_projects_list_file=$HOME/.programming_projects_list.json

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
    unset curr_dir
}

function project_creator() {
    if [[ ! $(command -v jq) ]]; then
        printf "%s\n" "jq not installed, doing nothing."
    fi

    function add_to_json() {
        path=$(realpath "$1")
        if [[ ! -f $_programming_projects_list_file ]]; then
            touch $_programming_projects_list_file
            printf "{\n\t\"projects:\"[]\n}\n" >> $_programming_projects_list_file
        fi

        updated_file=$(jq ".projects += [\"${path}\"]" $_programming_projects_list_file)
        echo "" > $_programming_projects_list_file
        echo $updated_file >> $_programming_projects_list_file
        unset updated_files
    }

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
            printf "[CREATING C PROJECT]\n"
            read -p "Enter Project Name: " projectName
            local projectFolder=$(realpath "${PROGRAMMING_PROJECTS}/${projectName}")
            mkdir -pv $projectFolder/{src/include,doc,build,test}
            touch $projectFolder/{README.md,makefile,src/main.c,.gitignore}
            curl -L "https://raw.githubusercontent.com/github/gitignore/main/C.gitignore" >> $projectFolder/.gitignore

            printf "Creating README.md file\n"
            printf "# %s\n\n" $projectName >> $projectFolder/README.md
            printf "\rREADME.md file created.\n"

            printf "Creating src/main.c file\n"
            printf "#include <stdio.h>\n" >> $projectFolder/src/main.c
            printf "#include <stdlib.h>\n\n" >> $projectFolder/src/main.c
            printf "int main() {\n" >> $projectFolder/src/main.c
            printf "\tprintf(\"Hello World!\\n\");\n" >> $projectFolder/src/main.c
            printf "\n" >> $projectFolder/src/main.c
            printf "\treturn 0;\n" >> $projectFolder/src/main.c
            printf "}\n" >> $projectFolder/src/main.c
            printf "\rsrc/main.c file created.\n"

            printf "Creating makefile\n"

            printf "CC=gcc\n" >> $projectFolder/makefile
            printf "CFLAGS=-Wall -Wextra -Werror -Wshadow -Wfloat-equal -Wundef -Wpointer-arith -Wcast-align -Wstrict-prototypes -Wstrict-overflow=5 -Wwrite-strings -Waggregate-return -Wcast-qual -Wswitch-default -Wswitch-enum -Wconversion -Wunreachable-code -Wformat=2 -fverbose-asm -finstrument-functions --coverage -fsanitize={address,thread,undefined} -Winit-self -Wuninitialized -Werror=implicit-function-declaration -Wmissing-prototypes -g -O3 -pedantic -save-temps\n\n" >> $projectFolder/makefile
            printf "EDITOR=nvim\n\n" >> $projectFolder/makefile
            printf "SRC_DIR=src\n" >> $projectFolder/makefile
            printf "BUILD_DIR=build\n\n" >> $projectFolder/makefile
            printf ".PHONY main run clean code always\n" >> $projectFolder/makefile
            printf "main: \$(BUILD_DIR)/main always\n" >> $projectFolder/makefile
            printf "\t\$(CC) \$(CFLAGS) -o \$(BUILD_DIR)/main \$(SRC_DIR)/main.c\n\n" >> $projectFolder/makefile
            printf "run: main\n" >> $projectFolder/makefile
            printf "\t\$(BUILD_DIR)/main\n\n" >> $projectFolder/makefile
            printf "always: \$(BUILD_DIR)\n" >> $projectFolder/makefile
            printf "\tmkdir -p \$(BUILD_DIR)\n\n" >> $projectFolder/makefile
            printf "clean:\n" >> $projectFolder/makefile
            printf "\t rm -rf \$(BUILD_DIR)\n\n" >> $projectFolder/makefile
            printf "code:\n" >> $projectFolder/makefile
            printf "\tgit pull\n" >> $projectFolder/makefile
            printf "\t\$(EDITOR)\n" >> $projectFolder/makefile
            printf "\tgit add .\n" >> $projectFolder/makefile
            printf "\tgit commit -m \"Automatic commit\"\n" >> $projectFolder/makefile
            printf "\tgit push\n" >> $projectFolder/makefile

            printf "\rmakefile created.\n"

            if [[ -e $(command -v git) ]]; then
                git init
                git add .
                git commit -m "Initialized project $projectName"
                read -n 1 -p "Would you like to publish the Git repository on GitHub (y/n)? " gitanswer
                if [ "$gitanswer" != "${gitanswer#[Yy]}" ];then
                    if [[ -e $(command -v gh) ]]; then
                        read -n 1 -p "Is your repo public (y/n)? " repoView
                        if [ "$repoView" != "${repoView#[Yy]}" ]; then
                            gh repo create "$projectName" --public --source=.
                        else
                            gh repo create "$projectName" --private --source=.
                        fi
                        git branch -M main
                        git push -u origin main
                    else
                        printf "GitHub CLI not found initializing local repository only.\n"
                    fi
                fi
            else
                printf "Git not installed.\n"
            fi

            add_to_json $projectFolder
            declare -a texteditors

            if [[ -e $(command -v nvim) ]]; then
                texteditors+="nvim"
            elif [[ -e $(command -v vim) ]]; then
                texteditors+="vim"
            elif [[ -e $(command -v vi) ]]; then
                texteditors+="vi"
            elif [[ -e $(command -v emacs) ]]; then
                texteditors+="emacs"
            elif [[ -e $(command -v nano) ]]; then
                texteditors+="nano"
            elif [[ -e $(command -v micro) ]]; then
                texteditors+="micro"
            elif [[ -e $(command -v gedit) ]]; then
                texteditors+="gedit"
            elif [[ -e $(command -v ed) ]]; then
                texteditors+="ed"
            elif [[ -e $(command -v helix) ]]; then
                texteditors+="helix"
            elif [[ -e $(command -v textadept) ]]; then
                texteditors+="textadept"
            elif [[ -e $(command -v code) ]]; then
                texteditors+="code"
            elif [[ -e $(command -v codium) ]]; then
                texteditors+="codium"
            elif [[ -e $(command -v kakoune) ]]; then
                texteditors+="kakoune"
            elif [[ -e $(command -v kate) ]]; then
                texteditors+="kate"
            elif [[ -e $(command -v pluma) ]]; then
                texteditors+="pluma"
            elif [[ -e $(command -v mousepad) ]]; then
                texteditors+="mousepad"
            elif [[ -e $(command -v xorg-xedit) ]]; then
                texteditors+="xorg-xedit"
            else
                printf "Zero text editors found.\n"
            if

            fi

            if [[ "${#texteditors[@]}" -gt 1 ]]; then
                selected_editor=$(printf "%s\n" "${texteditors[@]}" | fzf)
            else
                selected_editor="${texteditors[0]}"
            fi


            if [ -e $(command -v tmux) ]; then
                tmux_running=$(pgrep tmux)
                if [[ -z $TMUX ]] && [[ -z $tmux_running ]]; then
                    tmux new-session -ds $projectName -c $projectFolder
                    tmux send-keys -t $projectName "$selected_editor" Enter
                    read -n 1 -p "Would you like to delete your current tmux session (y/n)? " deltmuxsessanswer
                    if [ "$deltmuxsessanswer" != "${deltmuxsessanswer#[Yy]}" ];then
                        SESSION_ID=$(tmux display-message -p '#{session_id}')
                        tmux kill-session -t "$SESSION_ID"
                    fi
                    tmux attach-session -t $projectName
                    exit 0
                fi

                if ! tmux has-session -t=$projectName 2> /dev/null; then
                    tmux new-session -ds $projectName -c $projectFolder
                fi

                tmux switch-client -t $projectName
            else
                cd "${PROGRAMMING_PROJECTS}/${res}"
                clear
                exec $selected_editor
            fi
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

