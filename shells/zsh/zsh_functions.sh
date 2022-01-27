### History Search
autoload -Uz up-line-or-beginning-search down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search

[[ -n "${key[Up]}"   ]] && bindkey -- "${key[Up]}"   up-line-or-beginning-search
[[ -n "${key[Down]}" ]] && bindkey -- "${key[Down]}" down-line-or-beginning-search


### Dynamic title
autoload -Uz add-zsh-hook

function xterm_title_precmd () {
    print -Pn -- '\e]2;%n@%m %~\a'
    [[ "$TERM" == 'screen'* ]] && print -Pn -- '\e_\005{g}%n\005{-}@\005{m}%m\005{-} \005{B}%~\005{-}\e\\'
}

function xterm_title_preexec () {
    print -Pn -- '\e]2;%n@%m %~ %# ' && print -n -- "${(q)1}\a"
    [[ "$TERM" == 'screen'* ]] && { print -Pn -- '\e_\005{g}%n\005{-}@\005{m}%m\005{-} \005{B}%~\005{-} %# ' && print -n -- "${(q)1}\e\\"; }
}

if [[ "$TERM" == (Eterm*|alacritty*|aterm*|gnome*|konsole*|kterm*|putty*|rxvt*|screen*|tmux*|xterm*) ]]; then
    add-zsh-hook -Uz precmd xterm_title_precmd
    add-zsh-hook -Uz preexec xterm_title_preexec
fi

secedit() {
    _secureedit() {
        if [[ $(id -u) -ne 0 ]]; then
            printf "Please run as root\n"
            exit
        else
            RANDNUM1=$(< /dev/urandom tr -dc 0-9 | head -c 2)
            RANDFLNM=$(< /dev/urandom tr -dc @%+=_A-Z-a-z-0-9 | head -c ${RANDNUM1})
            ITERATIONS=1000000
            fullfilename=$(basename -- "$1")
            extension="${fullfilename##*.}"
            filename="${fullfilename%.*}"
            if [[ -e $(which openssl) ]]; then
                if [[ "${extension}" == "enc" ]]; then
                    openssl enc -aes-256-cbc -md sha512 -pbkdf2 -iter ${ITERATIONS} -salt -d -in ${fullfilename} -out "/tmp/${RANDFLNM}"
                    sleep 1
                    if [[ -e $(which vim) ]];then
                        zsh -c "vim /tmp/${RANDFLNM}"
                    else
                        zsh -c "rnano /tmp/${RANDFLNM}"
                    fi
                    sleep 1
                    openssl enc -aes-256-cbc -md sha512 -pbkdf2 -iter ${ITERATIONS} -salt -in "/tmp/${RANDFLNM}" -out "${filename}.enc"
                    zsh -c "shred -u /tmp/${RANDFLNM}"
                    zsh -c "chown root ${fullfilename}"
                    zsh -c "chmod 700 ${fullfilename}"
                else
                    if [[ -e $(which vim) ]];then
                        zsh -c "vim ${fullfilename}"
                    else
                        zsh -c "rnano ${fullfilename}"
                    fi
                    sleep 1
                    openssl enc -aes-256-cbc -md sha512 -pbkdf2 -iter ${ITERATIONS} -salt -in $1 -out "$1.enc"
                    zsh -c "shred -u ${fullfilename}"
                    zsh -c "chown root $1.enc"
                    zsh -c "chmod 700 $1.enc"
                fi
            else
                printf "Install the openssl package\n"
            fi
        fi
    }
    sudo zsh -c "$(declare -f _secureedit); _secureedit $1"
}

function twitchfetch() {
    bash -c '_randArr() {
        shopt -s nullglob
        local arr=("$@")
        /usr/bin/neofetch --ascii "${arr[RANDOM % $#]}"
        }
        arr2=($HOME/.config/neofetch/asciiArts/*)
        _randArr "${arr2[@]}"'
}
