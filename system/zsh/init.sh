#!/usr/bin/env zsh

# VARIABLES

PROGRAMMING_PROJECTS="$HOME/usr/Programming/Projects"
PROGRAMMING_PRATICES="$HOME/usr/Programming/Pratices"
DOTFILES="$HOME/etc/dotfiles.d"
local _programming_projects_list_file=$HOME/.programming_projects_list.json

# ALIASES
if [[ -a "$(command -v doas)" ]]; then
    alias sudo='doas'
    alias dias='doas'
    alias root='doas -u root su'
    alias su='doas -u root su'
  
    if [[ -a "$(command -v nvim)" ]];then
        alias sudoedit='doas nvim'
    fi
else
    alias root='sudo -i'
    alias su='sudo -i'
fi

alias lscmds="history | awk '{print \$2}' | sort | uniq -c | sort -nr | head -16"

alias nv="nvim"
alias count='find . -type f | wc -l'
alias ping='ping -c 5'
alias untar='tar -zxvf'

alias mv='mv -i'
alias cp='cp -i'
alias ln='ln -i'
alias chown='chown --preserve-root'
alias chmod='chmod --preserve-root'
alias chgrp='chgrp --preserve-root'

#alias tmux="tmux -2"

alias initsystem="rm -rfv $HOME/.cache/* && clear && startx"
alias initsys=initsystem
alias cd='z'

# Error correction
# Vim aliases 
alias :q="exit"
alias :wq="exit"
alias :w="exit"

# Typos
alias cler="clear"
alias claer="clear"
alias clar="clear"
alias cleer="clear"
alias claar="clear"
alias clera="clear"
alias cçear="clear"
alias cls="clear"
alias clr="clear"

alias dc="cd"
alias cdc="cd"
alias dcd="cd"
alias cdd="cd"
alias dcc="cd"
alias ccd="cd"
alias ddc="cd"
alias cd.='cd ../'
alias cd..='cd ../../'
alias cd...='cd ../../../'
alias cd....='cd ../../../../'
alias cd.....='cd ../../../../../'
alias dc.="cd."
alias dc..="cd.."
alias dc...="cd..."
alias dc....="cd...."
alias dc.....="cd....."

alias exi="exit"
alias ext="exit"
alias exot="exit"

alias sl="ls"
alias ssl="ls"
alias lls="ls"

alias ssh="TERM=tmux-256color ssh"

# HELPER FUNCTIONS
function fmap() {
  local -n input_list=$1
  local -r transform_fn=$2

  local mapped_list=()
  for element in "${input_list[@]}"; do
    mapped_list+=("$("$transform_fn" "$element")")
  done

  echo "${mapped_list[@]}"
}

function ffilter() {
  local -n input_list=$1
  local -r predicate=$2

  local filtered_list=()
  for element in "${input_list[@]}"; do
    if "$predicate" "$element"; then
      filtered_list+=("$element")
    fi
  done

  echo "${filtered_list[@]}"
}

function freduce() {
  local -n input_list=$1
  local -r accumulate_fn=$2
  local initial_value=$3

  local accumulator=$initial_value
  for element in "${input_list[@]}"; do
    accumulator="$("$accumulate_fn" "$accumulator" "$element")"
  done

  echo "$accumulator"
}

function fsum() {
  local accumulator=$1
  local element=$2
  echo "$((accumulator + element))"
}

function fzip() {
  local -n input_list1=$1
  local -n input_list2=$2

  local zipped_list=()
  local length=${#input_list1[@]}

  for ((i=0; i<length; i++)); do
    zipped_list+=("${input_list1[$i]},${input_list2[$i]}")
  done

  echo "${zipped_list[@]}"
}

function fcompose() {
  local result="$1"
  shift
  for func in "$@"; do
    result="$($func "$result")"
  done
  echo "$result"
}

function project_search() {
    local selectedProject=$(jq -r '.projects[]' $_programming_projects_list_file | fzf)
    local prPath=$(realpath "$selectedProject")
    local prName=$(basename "$prPath")

    echo $prPath
    echo $prName

    if [[ -a "$(command -v tmux)" ]]; then
        echo "TMUX EXISTS"
    else
        echo "NO"
    fi

    # if [[ -a "$(command -v tmux)" ]]; then
    #     tmux_running=$(pgrep tmux)
    #     if [[ -z $TMUX ]] && [[ -z $tmux_running ]]; then
    #         tmux new-session -s $prName -c $prPath
    #         exit 0
    #     fi
    #
    #     if ! tmux has-session -t=$prName 2> /dev/null; then
    #         otmx=$TMUX
    #         unset TMUX
    #         tmux new-session -ds $prName -c $prPath
    #     fi
    #         tmux switch-client -t $prName
    #         export TMUX=$otmx
    # else
    #     cd "${prPath}"
    #     clear
    # fi

    unset prName
    unset prPath
    unset selectedProject
}

function edit_dotfiles() {
    if [[ ! -a "$(command -v git)" ]]; then
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

function add_to_json() {
    if [[ ! -a "$(command -v jq)" ]]; then
        printf "%s\n" "jq not installed, doing nothing."
    fi
    local ppath=$(realpath "$1")
    if [[ ! -e $_programming_projects_list_file ]]; then
        touch $_programming_projects_list_file
        printf "{\n\t\"projects\": []\n}\n" >> $_programming_projects_list_file
    fi

    # local updated_file=$(jq ".projects += [\"${ppath}\"]" $_programming_projects_list_file)
    local updated_file=$(jq "if (.projects | index(\"${ppath}\")) then . else .projects += [\"${ppath}\"] end" $_programming_projects_list_file)
    echo "" > $_programming_projects_list_file
    echo "$updated_file" >> $_programming_projects_list_file
    unset updated_files
    unset ppath
}

function remove_from_json() {
    if [[ ! -a "$(command -v jq)" ]]; then
        printf "%s\n" "jq not installed, doing nothing."
    fi
    local ppath=$(realpath "$1")

    local updated_file=$(jq "if (.projects | index(\"${ppath}\")) then .projects |= map(select(. != \"${ppath}\")) else . end" $_programming_projects_list_file)
    echo "" > $_programming_projects_list_file
    echo "$updated_file" >> $_programming_projects_list_file
    unset updated_files
    unset ppath
}

function add_current_dir_to_json() {
    c_dir=$(realpath "$(pwd)")
    add_to_json "${c_dir}"
    unset c_dir
}

function remove_current_dir_from_json() {
    c_dir=$(realpath "$(pwd)")
    remove_from_json "${c_dir}"
    unset c_dir
}

function select_terminal_text_editor() {
    declare -a available_editors
    declare -a texteditors=(
        "nvim"
        "vim"
        "vi"
        "emacs"
        "nano"
        "micro"
        "gedit"
        "ed"
        "helix"
        "textadept"
        "code"
        "codium"
        "kakoune"
        "kate"
        "pluma"
        "mousepad"
        "xorg-xedit"
    )

    for editor in "${texteditors[@]}"; do
        if command -v "$editor" &> /dev/null; then
            available_editors+=("$editor")
        fi
    done

    if (( ${#available_editors[@]} == 0 )); then
        printf "0"
    elif (( ${#available_editors[@]} == 1 )); then
        sel_editor=${available_editors[1]}
    else
        sel_editor=$(printf "%s\n" "${available_editors[@]}" | fzf)
    fi

    printf "%s" $sel_editor
    unset sel_editor
    unset texteditors
}

function project_creator() {
    if [[ ! -a "$(command -v jq)" ]]; then
        printf "%s\n" "jq not installed, doing nothing."
    fi

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
        "[META] Empty"
    )

    answer=$(printf "%s\n" "${options[@]}" | fzf)
    result=$(echo $answer | cut -d' ' -f2)
    if [[ ! -d $PROGRAMMING_PROJECTS ]]; then
        mkdir -p $PROGRAMMING_PROJECTS
    fi

    printf "[CREATING %s PROJECT]\n" "$(echo \"$result\" | tr '[:lower:]' '[:upper:]')"
    printf "Enter Project Name: " 
    read -r projectName
    printf "\n"
    local projectFolder=$(realpath "${PROGRAMMING_PROJECTS}/${projectName}")

    case $result in
        "C")
            mkdir -pv $projectFolder/{src/include,doc,build}
            touch $projectFolder/{README.md,makefile,src/main.c,.gitignore}

            printf "# Prerequisites\n*.d\n\n# Object files\n*.o\n*.ko\n*.obj\n*.elf\n\n# Linker output\n*.ilk\n*.map\n*.exp\n\n# Precompiled Headers\n*.gch\n*.pch\n\n# Libraries\n*.lib\n*.a\n*.la\n*.lo\n\n# Shared objects (inc. Windows DLLs)\n*.dll\n*.so\n*.so.*\n*.dylib\n\n# Executables\n*.exe\n*.out\n*.app\n*.i*86\n*.x86_64\n*.hex\n\n# Debug files\n*.dSYM/\n*.su\n*.idb\n*.pdb\n\n# Kernel Module Compile Results\n*.mod*\n*.cmd\n.tmp_versions/\nmodules.order\nModule.symvers\nMkfile.old\ndkms.conf\n\n# Directories\nbuild/\n" >> $projectFolder/.gitignore 

            printf "Creating README.md file\n"
            printf "# %s\n\n" $projectName >> $projectFolder/README.md
            printf "README.md file created.\n"

            printf "Creating src/main.c file\n"

            printf "#include <stdio.h>\n" >> $projectFolder/src/main.c
            printf "#include <stdlib.h>\n\n" >> $projectFolder/src/main.c
            printf "int main() {\n" >> $projectFolder/src/main.c
            printf "\tprintf(\"Hello World!\\\n\");\n" >> $projectFolder/src/main.c
            printf "\n" >> $projectFolder/src/main.c
            printf "\treturn 0;\n" >> $projectFolder/src/main.c
            printf "}\n" >> $projectFolder/src/main.c

            printf "src/main.c file created.\n"

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

            printf "makefile created.\n"
        ;;
        "Assembly")
            mkdir -pv $projectFolder/{src/{include},build}
            touch $projectFolder/{README.md,makefile,src/main.asm,.gitignore}
            printf "# Directories\nbuild/\n" >> $projectFolder/.gitignore

            printf "Creating README.md file\n"
            printf "# %s\n\n" $projectName >> $projectFolder/README.md
            printf "README.md file created.\n"

            if ( -a "$(command -v gas)" || -a "$(command -v as)") && -a "$(command -v nasm)"; then
                printf "Would you like to use INTEL Syntax (y/n)? "
                read -r -k1 asmsyntax
                printf "\n"
                if [ "$asmsyntax" != "${asmsyntax#[Yy]}" ];then
                    printf "section .data\n" >> $projectFolder/src/main.asm
                    printf "\thello\tdb\t\"Hello World\!\", 10\t\t\t\t\t\t\t\t\t\t\t\t; string to be printed, with newline character (10)\n" >> $projectFolder/src/main.asm
                    printf "section .text\n" >> $projectFolder/src/main.asm
                    printf "global _start\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t; entry point for the program\n" >> $projectFolder/src/main.asm
                    printf "_start:\n" >> $projectFolder/src/main.asm
                    printf "\t; write system call\n" >> $projectFolder/src/main.asm
                    printf "\tmov\t\trax, 1\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t; syscall number for write\n" >> $projectFolder/src/main.asm
                    printf "\tmov\t\trdi, 1\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t; file descriptor 1 (stdout)\n" >> $projectFolder/src/main.asm
                    printf "\tmov\t\trsi, hello\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t; pointer to the message to print\n" >> $projectFolder/src/main.asm
                    printf "\tmov\t\trdx, 13\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t; message length\n" >> $projectFolder/src/main.asm
                    printf "\tsyscall\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t; invoke syscall\n\n" >> $projectFolder/src/main.asm
                    printf "\t; exit system call\n" >> $projectFolder/src/main.asm
                    printf "\tmov\t\trax, 60\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t; syscall number for exit\n" >> $projectFolder/src/main.asm
                    printf "\txor\t\trdi, rdi\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t; exit code 0\n" >> $projectFolder/src/main.asm
                    printf "\tsyscall\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t; invoke syscall\n" >> $projectFolder/src/main.asm

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

                    printf "makefile created.\n"

                else
                    printf ".section .data\n" >> $projectFolder/src/main.s
                    printf "\thello: .string \"Hello World\!\\\n\"\t\t\t\t\t\t\t\t\t\t\t\t# string to be printed, with newline character\n\n" >> $projectFolder/src/main.s
                    printf ".section .text\n" >> $projectFolder/src/main.s
                    printf "\t.globl _start\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t# entry point for the program\n\n" >> $projectFolder/src/main.s
                    printf "_start:\n" >> $projectFolder/src/main.s
                    printf "\t# write system call\n" >> $projectFolder/src/main.s
                    printf "\tmov\t\$1, %%rax\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t# syscall number for write\n" >> $projectFolder/src/main.s
                    printf "\tmov\t\$1, %%rdi\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t# file descriptor 1 (stdout)\n" >> $projectFolder/src/main.s
                    printf "\tmov\t\$hello, %%rsi\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t# pointer to the message to print\n" >> $projectFolder/src/main.s
                    printf "\tmov\t\$13, %%rdx\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t# message length\n" >> $projectFolder/src/main.s
                    printf "\tsyscall\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t# invoke syscall\n\n" >> $projectFolder/src/main.s

                    printf "\t# exit system call\n" >> $projectFolder/src/main.asm
                    printf "\tmov\t\$60, %%rax\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t# syscall number for exit\n" >> $projectFolder/src/main.s
                    printf "\txor\t%%rdi, %%rdi\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t# exit code 0\n" >> $projectFolder/src/main.s
                    printf "\tsyscall\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t# invoke syscall\n" >> $projectFolder/src/main.s
                fi

                unset asmsyntax
            elif -a "$(command -v gas)" || -a "$(command -v as)"; then
                printf ".section .data\n" >> $projectFolder/src/main.asm
                printf "\thello: .string \"Hello World\!\\\n\"\t\t\t\t\t\t\t\t\t\t\t\t# string to be printed, with newline character\n\n" >> $projectFolder/src/main.asm
                printf ".section .text\n" >> $projectFolder/src/main.asm
                printf "\t.globl _start\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t# entry point for the program\n\n" >> $projectFolder/src/main.asm
                printf "_start:\n" >> $projectFolder/src/main.asm
                printf "\t# write system call\n" >> $projectFolder/src/main.asm
                printf "\tmov\t\$1, %%rax\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t# syscall number for write\n" >> $projectFolder/src/main.asm
                printf "\tmov\t\$1, %%rdi\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t# file descriptor 1 (stdout)\n" >> $projectFolder/src/main.asm
                printf "\tmov\t\$hello, %%rsi\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t# pointer to the message to print\n" >> $projectFolder/src/main.asm
                printf "\tmov\t\$13, %%rdx\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t# message length\n" >> $projectFolder/src/main.asm
                printf "\tsyscall\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t# invoke syscall\n\n" >> $projectFolder/src/main.asm
                printf "\t# exit system call\n" >> $projectFolder/src/main.asm
                printf "\tmov\t\$60, %%rax\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t# syscall number for exit\n" >> $projectFolder/src/main.asm
                printf "\txor\t%%rdi, %%rdi\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t# exit code 0\n" >> $projectFolder/src/main.asm
                printf "\tsyscall\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t# invoke syscall\n" >> $projectFolder/src/main.asm
            elif -a "$(command -v nasm)"; then
                printf "section .data\n" >> $projectFolder/src/main.asm
                printf "\thello\tdb\t\"Hello World\!\", 10\t\t\t\t\t\t\t\t\t\t\t\t; string to be printed, with newline character (10)\n" >> $projectFolder/src/main.asm
                printf "section .text\n" >> $projectFolder/src/main.asm
                printf "global _start\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t; entry point for the program\n" >> $projectFolder/src/main.asm
                printf "_start:\n" >> $projectFolder/src/main.asm
                printf "\t; write system call\n" >> $projectFolder/src/main.asm
                printf "\tmov\t\trax, 1\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t; syscall number for write\n" >> $projectFolder/src/main.asm
                printf "\tmov\t\trdi, 1\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t; file descriptor 1 (stdout)\n" >> $projectFolder/src/main.asm
                printf "\tmov\t\trsi, hello\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t; pointer to the message to print\n" >> $projectFolder/src/main.asm
                printf "\tmov\t\trdx, 13\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t; message length\n" >> $projectFolder/src/main.asm
                printf "\tsyscall\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t; invoke syscall\n\n" >> $projectFolder/src/main.asm
                printf "\t; exit system call\n" >> $projectFolder/src/main.asm
                printf "\tmov\t\trax, 60\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t; syscall number for exit\n" >> $projectFolder/src/main.asm
                printf "\txor\t\trdi, rdi\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t; exit code 0\n" >> $projectFolder/src/main.asm
                printf "\tsyscall\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t; invoke syscall\n" >> $projectFolder/src/main.asm
            else
                echo "AS,GAS nor NASM exists"
            fi


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
        "Empty")
            echo "Empty";
        ;;
        *)
            printf "%s\n" "Unknown Option, doing nothing."
        ;;
    esac



    if [[ -a "$(command -v git)" ]]; then
        curr_dir=$(pwd)
        cd $projectFolder
        if [[ ! -d "./.git" ]]; then
            git init
        fi
        git add .
        git commit -m "Initialized project $projectName"
        if ping -q -c 1 -W 1 8.8.8.8 >/dev/null; then
            printf "Would you like to publish the Git repository on GitHub (y/n)? "
            read -r -k1 gitanswer
            printf "\n"
            if [ "$gitanswer" != "${gitanswer#[Yy]}" ];then
                if [[ -a "$(command -v gh)" ]]; then
                    printf "Is your repo public (y/n)? "
                    read -r -k1 repoView
                    printf "\n"
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
            echo "No network connection available, initializing local repository only. \n"
        fi
        cd $curr_dir
        unset curr_dir
    else
        printf "Git not installed.\n"
    fi

    add_to_json $projectFolder
    selected_editor=$(select_terminal_text_editor)
    if [[ $selected_editor == "0" ]]; then
        printf "Zero text editors found.\n"
    fi

    if [[ -a "$(command -v tmux)" ]]; then
        tmux_running=$(pgrep tmux)
        if [[ -z $TMUX ]] && [[ -z $tmux_running ]]; then
            tmux new-session -s $projectName -c $projectFolder
            exit 0
        fi

        if ! tmux has-session -t=$projectName 2> /dev/null; then
            tmux new-session -ds $projectName -c $projectFolder
            tmux send-keys -t "${projectName}" "${selected_editor} && clear" Enter
            printf "Would you like to delete your current tmux session (y/n)? "
            read -r -k1 deltmuxsessanswer
            printf "\n"
            tmux switch-client -t $projectName
            if [ "$deltmuxsessanswer" != "${deltmuxsessanswer#[Yy]}" ];then
                SESSION_ID=$(tmux display-message -p '#{session_id}')
                tmux kill-session -t "$SESSION_ID"
            fi
        fi
    else
        cd "${projectFolder}"
        clear
        eval $selected_editor
    fi

    unset options
    unset answer
    unset result
    unset projectName
    unset projectFolder
    unset gitanswer
    unset repoView
    unset tmux_running
    unset deltmuxsessanswer
    unset SESSION_ID
    unset selected_editor
}

function pkg() {
    operation="${@[1]}"
    args="${@:2}"
    num_args=$#args[3,-1]
    
    case $operation in
        "install" || "i")
            sudo bash -c 'rm -rfv /etc/pacman.d/mirrorlist; while IFS="" read -r p || [ -n "$p" ]; do printf "%s\n" "${p##\#}" >> /etc/pacman.d/mirrorlist; done <<< $(curl https://archlinux.org/mirrorlist/all/)'
            yay -Syyy
            yay -Fy
            if [[ $num_args -eq 0 ]]; then
                yay -Slq | fzf --border-label="Packages" --multi --preview-label="Info" --preview 'cat <(yay -Si {1}) <(yay -Fl {1} | awk "{print \$2}" | bat --color=always --style=plain --line-range=:500)' | xargs -ro yay -S
            else
                yay -Syyy $args
            fi
        ;;
        "update" || "s")
            sudo bash -c 'rm -rfv /etc/pacman.d/mirrorlist; while IFS="" read -r p || [ -n "$p" ]; do printf "%s\n" "${p##\#}" >> /etc/pacman.d/mirrorlist; done <<< $(curl https://archlinux.org/mirrorlist/all/)'
            yay -Syyy
            yay -Fy
            yay -Syyyu
        ;;
        "remove" || "r")
            yay -Fy
            if [[ $num_args -eq 0 ]]; then
                yay -Qq | fzf --border-label="Packages" --multi --preview-label="Info" --preview 'cat <(yay -Qi {1}) <(yay -Fl {1} | awk "{print \$2}" | bat --color=always --style=plain --line-range=:500)' | xargs -ro yay -Rnsc
            else
                yay -Rnsc $args
            fi
        ;;
        "refresh" || "u")
            sudo bash -c 'rm -rfv /etc/pacman.d/mirrorlist; while IFS="" read -r p || [ -n "$p" ]; do printf "%s\n" "${p##\#}" >> /etc/pacman.d/mirrorlist; done <<< $(curl https://archlinux.org/mirrorlist/all/)'
            yay -Syyy
            yay -Fy
        ;;
        *)
            yay --help
        ;;
    esac

    unset args
    unset num_args
    unset operation
}

# KEYBINDS

# Binds CTRL+e to the edit_dotifiles function
bindkey -s '^E' 'edit_dotfiles && clear\n'

# Binds CTRL+t to the add_current_dir_to_json function
bindkey -s '^T' 'add_current_dir_to_json && clear\n'

# Binds CTRL+r to the remove_current_dir_from_json function
bindkey -s '^R' 'remove_current_dir_from_json && clear\n'

# Binds CTRL+p to the project_creator function
bindkey -s '^P' 'project_creator && clear\n'

# Binds CTRL+f to the project_search function
bindkey -s '^F' 'project_search && clear\n'

# Enables zoxide
eval "$(zoxide init zsh)"

