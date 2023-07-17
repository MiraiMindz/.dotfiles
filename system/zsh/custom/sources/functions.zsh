#!/usr/bin/env zsh

function fzcd() {
  cd "$(while IFS="" read -r line; do echo "${line#*:}/"; done < "${HOME}/.warprc" | while IFS="" read -r line; do echo "${line#*:}"; done <<< "$(fd -d 4 --type d . /home/mirai/Arquivos)" | fzf --border-label="Projects Folders" --preview-label="Contents" --preview 'cat <(while IFS="" read -r line; do echo "${line#*{}}"; done <<< "$(fd --type f . {} | as-tree | bat --color=always --style=numbers --line-range=:500)")')"
  clear 
}

function pkginstall() {
  clear
  yay -Fyyy 
  yay -Slq | fzf --border-label="Packages" --multi --preview-label="Info" --preview 'cat <(yay -Si {1}) <(yay -Fl {1} | awk "{print \$2}" | bat --color=always --style=plain --line-range=:500)' | xargs -ro yay -S
}

function pkgremove() {
  clear
  yay -Qq | fzf --border-label="Packages" --multi --preview-label="Info" --preview 'cat <(yay -Qi {1}) <(yay -Fl {1} | awk "{print \$2}" | bat --color=always --style=plain --line-range=:500)' | xargs -ro yay -Rns
}

function editdot() {
  sh -c "curdir=\$(pwd); cd $DOTFILES && nvim; cd \$curdir"
}

function mount_func() {
    /usr/bin/mount | awk -F' ' '{ printf \"%s\t%s\n\",\$1,\$3; }' | column -t | grep -E ^/dev/ | sort
}

function shreddir() {
  /usr/bin/find $1 -type f -exec /usr/bin/shred -n 30 -v -u {} \;
  /usr/bin/rmdir $1 
}

function rm_func() {
  /usr/bin/shred -n 30 -v -u $1
  /usr/bin/rm -rf -I --preserve-root $1
}

function project_creator() {
    HELPER_FUNCTIONS=$DOTFILES/system/zsh/custom/sources/project_creator_templates

    declare -a templates
    templates=(
        "Next JS"
        "Go Lang"
        "C Lang"
        "Python"
    )

    answer=$(printf "%s\n" "${templates[@]}" | fzf)

    if [[ ! -d $PROGRAMMING_PROJECTS ]]; then
        mkdir -p $PROGRAMMING_PROJECTS
    fi
    
    local gitConfigUserString="$(git config -l | grep user.name)"
    gitUserName="${gitConfigUserString#*=}"

    case $answer in
        "Next JS")
            sh $HELPER_FUNCTIONS/next_js.sh
        ;;
        "Go Lang")
            sh $HELPER_FUNCTIONS/go_lang.sh
        ;;
        "C Lang")
            sh $HELPER_FUNCTIONS/c_lang.sh
        ;;
        "Python")
            cd $PROGRAMMING_PROJECTS
            clear
            read -p "Enter Project Name: " projectName
            projectFolder="${PROGRAMMING_PROJECTS}/${projectName}"
            mkdir -p $projectFolder
            mkdir -p $projectFolder
        ;;
        *)
            printf "Wrong Template, doing nothing\n"
        ;;
    esac
}






