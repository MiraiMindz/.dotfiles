#!/usr/bin/env zsh

function fzcd() {
    local projs_temp_var=""
    local find_depth=1
    if [[ -e "$HOME/.warprc" ]]; then
        projs_temp_var+=$(cat "$HOME/.warprc")
    fi
    projs_temp_var+=$(fd -d $find_depth --type d . $PROGRAMMING_PROJECTS)
    local res="$(while IFS="" read -r line; do echo ${line#"$PROGRAMMING_PROJECTS/"}; done <<< $(echo $projs_temp_var) | fzf --border-label="Programming Projects" --preview-label="Project Contents" --preview 'cat <(while IFS="" read -r line; do echo "${line#*{}}"; done <<< $(fd --type f . $PROGRAMMING_PROJECTS/{} | as-tree | bat --color=always --style=numbers --line-range=:500))')"
    if [[ "$res" != "" ]]; then
        cd "${PROGRAMMING_PROJECTS}/${res}"
    fi
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
  sh -c "curdir=\$(pwd); cd $DOTFILES && nvim && git add . && git commit -m 'made some changes' && git push; cd \$curdir"
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

function editnotes() {
    CHOICE=$(dialog --menu "Select a option" \
            0 0 5 "1" "Quick Notes" \
            "2" "Personal Notes" \
            3>&1 1>&2 2>&3 3>&-)
    clear
    case $CHOICE in
        "1" || 1)
            quick_notes="$HOME/usr/.quick_notes"
            /usr/bin/nvim "$quick_notes"
        ;;
        "2" || 2)
            trap SIGINT
            trap EXIT
            local personal_notes="$HOME/usr/.personal_notes"
            local passwd0=$(dialog --passwordbox "Type Password" 0 0 3>&1 1>&2 2>&3 3>&-)
            local passwd1=$(dialog --passwordbox "Re-type Password" 0 0 3>&1 1>&2 2>&3 3>&-)
            if [[ "$passwd0" == "$passwd1" ]]; then
                passwd0=$(openssl rand -hex 16)
                passwd1=$(openssl rand -hex 16)
                unset passwd0
                unset passwd1
                if [[ ! -e "$personal_notes" ]]; then
                    local tmp_file=$(mktemp)
                    /usr/bin/nvim "$tmp_file"
                    openssl enc -k "$passwd0" -aes256 -base64 -e -pbkdf2 -in "$tmp_file" -out "$personal_notes"
                    rm -f "$tmp_file"
                else
                    local tmp_file=$(mktemp)
                    openssl enc -k "$passwd0" -aes256 -base64 -d -pbkdf2 -in "$personal_notes" -out "$tmp_file"
                    /usr/bin/nvim "$tmp_file"
                    rm -f "$personal_notes"
                    openssl enc -k "$passwd0" -aes256 -base64 -e -pbkdf2 -in "$tmp_file" -out "$personal_notes"
                    rm -f "$tmp_file"
                fi
            else
                passwd0=$(openssl rand -hex 16)
                passwd1=$(openssl rand -hex 16)
                unset passwd0
                unset passwd1
                printf "Passwords do not match\n"
            fi
            trap - EXIT
            trap - SIGINT
        ;;
        *)
            quick_notes="$HOME/usr/.quick_notes"
            /usr/bin/nvim "$quick_notes"
        ;;
    esac
    clear
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
            sh $HELPER_FUNCTIONS/python.sh
        ;;
        *)
            printf "Wrong Template, doing nothing\n"
        ;;
    esac
}

function cheatsheet() {
    python3 $HOME/etc/dotfiles.d/system/zsh/custom/sources/scripts/cheatsheet.py
    clear
}

# Connect Remote Server (CRS)
function crs() {
    usernameRaw=$(cat $DOTFILES/system/zsh/custom/sources/environment/.server_user.txt)
    addressRaw=$(cat $DOTFILES/system/zsh/custom/sources/environment/.server_address.txt)
    username="${usernameRaw// /}"
    address="${addressRaw// /}"
    finalConnection="${username}@${address}"
    ssh $finalConnection
}


