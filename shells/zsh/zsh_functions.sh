if [[ -e $HOME/.zsh/aliases.sh ]]; then
    source $HOME/.zsh/aliases.sh
fi

if [[ -e $HOME/.bash/bash-text-formatting.sh ]]; then
    source $HOME/.bash/bash-text-formatting.sh
fi


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

function twitchfetch() {
    bash -c '_randArr() {
        shopt -s nullglob
        local arr=("$@")
        /usr/bin/neofetch --ascii "${arr[RANDOM % $#]}"
        }
        arr2=($HOME/.config/neofetch/asciiArts/*)
        _randArr "${arr2[@]}"'
}

function secedit() {
    _secureedit() {
        trap '' INT
        if [[ $(id -u) -ne 0 ]]; then
            printf "Please run as root\n"
            exit
        else
            if [[ -e $(which mktemp) ]]; then
                RANDFL=$(mktemp)
                RANDFLNM=${RANDFL##*'/tmp/'}
            else
                RANDNUM1=$(< /dev/urandom tr -dc 0-9 | head -c 2)
                RANDFLNM=$(< /dev/urandom tr -dc @%+=_A-Z-a-z-0-9 | head -c ${RANDNUM1})
            fi
            ITERATIONS=1000000
            fullfilename=$(basename -- "$1")
            extension="${fullfilename##*.}"
            filename="${fullfilename%.*}"
            if [[ -e $(which openssl) ]]; then
                if [[ "${extension}" == "enc" ]]; then
                    openssl enc -aes-256-cbc -md sha512 -pbkdf2 -iter ${ITERATIONS} -salt -d -in ${fullfilename} -out "/tmp/${RANDFLNM}"
                    sleep 1
                    if [[ -e $(which vim) ]];then
                        bash -c "vim /tmp/${RANDFLNM}"
                    else
                        bash -c "rnano /tmp/${RANDFLNM}"
                    fi
                    sleep 1
                    openssl enc -aes-256-cbc -md sha512 -pbkdf2 -iter ${ITERATIONS} -salt -in "/tmp/${RANDFLNM}" -out "${filename}.enc"
                    bash -c "shred -u /tmp/${RANDFLNM}"
                    bash -c "chown root ${fullfilename}"
                    bash -c "chmod 700 ${fullfilename}"
                else
                    if [[ -e $(which vim) ]];then
                        bash -c "vim ${fullfilename}"
                    else
                        bash -c "rnano ${fullfilename}"
                    fi
                    sleep 1
                    openssl enc -aes-256-cbc -md sha512 -pbkdf2 -iter ${ITERATIONS} -salt -in $1 -out "$1.enc"
                    bash -c "shred -u ${fullfilename}"
                    bash -c "chown root $1.enc"
                    bash -c "chmod 700 $1.enc"
                fi
            else
                printf "Install the openssl package\n"
            fi
        fi
    }
    sudo bash -c "$(declare -f _secureedit); _secureedit $1"
}

function hwinfo() {
    _hinf() {
        shopt -s checkwinsize; (:;:)
        cpuln="================================ CPU ================================"
        memln="================================ MEMORY ================================"
        diskln="================================ DISK ================================"
        netln="================================ NET ================================"
        printf "${DARK_RED_16_fg}\n%*s\n\n${NOCOLOR_16_fg}" $(((${#cpuln}+$COLUMNS)/2)) "$cpuln"
        cpuinfo
        printf "${DARK_RED_16_fg}\n%*s\n\n${NOCOLOR_16_fg}" $(((${#memln}+$COLUMNS)/2)) "$memln"
        meminfo -w
        printf "${DARK_RED_16_fg}\n%*s\n\n${NOCOLOR_16_fg}" $(((${#diskln}+$COLUMNS)/2)) "$diskln"
        lsblk -o "NAME,MAJ:MIN,RM,SIZE,RO,FSTYPE,MOUNTPOINT,UUID"
        printf "${DARK_RED_16_fg}\n%*s\n\n${NOCOLOR_16_fg}" $(((${#netln}+$COLUMNS)/2)) "$netln"
        ip ad show
        printf "\n"
    }
    bash -c "$(declare -f _hinf); _hinf"
}

if [[ -e $(which cool-retro-term) ]]; then
    if [[ $(ps -o 'cmd=' -p $(ps -o 'ppid=' -p $$)) == "cool-retro-term" ]]; then
        function changeThemeCoolRetroTerm() {
            _chtm() {
                if [[ -e /usr/lib/qt/qml/QMLTermWidget/color-schemes/cool-retro-term.colorscheme ]]; then
                    sudo rm /usr/lib/qt/qml/QMLTermWidget/color-schemes/cool-retro-term.colorscheme
                    printf "Please select one of these ${DARK_GREEN_16_fg}themes${NOCOLOR_16_fg}:\n"
                    printf "${DARK_GREEN_16_fg}0${NOCOLOR_16_fg}. Default\n"
                    printf "${DARK_GREEN_16_fg}1${NOCOLOR_16_fg}. Dracula\n"
                    printf "${DARK_GREEN_16_fg}2${NOCOLOR_16_fg}. MaterialOcean\n"
                    printf "${DARK_GREEN_16_fg}3${NOCOLOR_16_fg}. Nord\n"
                    read -e -p "Enter the number: " CHOICE
                    case $CHOICE in
                    "0" | 0)
                        sudo ln -sf $HOME/.dotfiles/terminals/cool-retro-term/Themes/default.colorscheme /usr/lib/qt/qml/QMLTermWidget/color-schemes/cool-retro-term.colorscheme
                    ;;
                    "1" | 0)
                        sudo ln -sf $HOME/.dotfiles/terminals/cool-retro-term/Themes/Dracula.colorscheme /usr/lib/qt/qml/QMLTermWidget/color-schemes/cool-retro-term.colorscheme
                    ;;
                    "2" | 1)
                        sudo ln -sf $HOME/.dotfiles/terminals/cool-retro-term/Themes/MaterialThemeOcean.colorscheme /usr/lib/qt/qml/QMLTermWidget/color-schemes/cool-retro-term.colorscheme
                    ;;
                    "3" | 2)
                        sudo ln -sf $HOME/.dotfiles/terminals/cool-retro-term/Themes/Nord.colorscheme /usr/lib/qt/qml/QMLTermWidget/color-schemes/cool-retro-term.colorscheme
                    ;;
                    *)
                        printf "${DARK_RED_16_fg}Invalid input, try again${NOCOLOR_16_fg}\n"
                    ;;
                    esac
                fi
                exec cool-retro-term &
                exit
            }
            bash -c "$(declare -f _chtm); _chtm"
            exit
        }
    fi
fi

function shreddir() {
    find $1 -type f -exec shred -n 30 -v -u {} \;
    rmdir $1
}

function cl() {
    DIR="$*";
        # if no DIR given, go home
        if [ $# -lt 1 ]; then
                DIR=$HOME;
    fi;
    builtin cd "${DIR}" && \
    # use your preferred ls command
        la
}

function gorun () {
    if [[ $(which go) ]];then
        go fmt $1
        go run $1
    fi
}

function initgit() {
    git init -b main && git add . && git commit -m "First commit" && git remote add origin "$1" && git remote -v && git push origin main
}

function tellmethephilosophy() {
    _telmtp() {
        printf "Please select which interpretation of the ${DARK_YELLOW_16_fg}Unix Philosophy${NOCOLOR_16_fg} you wanna see:\n0. ${DARK_GREEN_16_fg}Dennis Ritchie & Ken Thompson${NOCOLOR_16_fg}\n1. ${DARK_GREEN_16_fg}Doug McIlroy${NOCOLOR_16_fg}\n2. ${DARK_GREEN_16_fg}Peter H. Salus${NOCOLOR_16_fg}\n3. ${DARK_GREEN_16_fg}Eric Raymond${NOCOLOR_16_fg}\n4. ${DARK_GREEN_16_fg}Mike Gancarz${NOCOLOR_16_fg}\n"
    read -e -p "Enter your numeric choice: " PHILOSOPHY
    case $PHILOSOPHY in
        "0" | 0)
        printf "${DARK_BLUE_16_fg}Dennis Ritchie & Ken Thompson ${DARK_YELLOW_16_fg}Philosophy${NOCOLOR_16_fg}:\n\t1. Make it easy to write, test, and run programs.\n\t2. Interactive use instead of batch processing.\n\t3. Economy and elegance of design due to size constraints (\"salvation through suffering\").\n\t4. Self-supporting system: all Unix software is maintained under Unix.\n"
        ;;
        "1" | 1)
        printf "${DARK_BLUE_16_fg}Doug McIlroy ${DARK_YELLOW_16_fg}Philosophy${NOCOLOR_16_fg}:\n\t1. Make each program do one thing well. To do a new job, build afresh rather than complicate old programs by adding new \"features\".\n\t2. Expect the output of every program to become the input to another, as yet unknown, program. Don't clutter output with extraneous information.\n\t   Avoid stringently columnar or binary input formats. Don't insist on interactive input.\n\t3. Design and build software, even operating systems, to be tried early, ideally within weeks. Don't hesitate to throw away the clumsy parts and rebuild them.\n\t4. Use tools in preference to unskilled help to lighten a programming task\n\t   even if you have to detour to build the tools and expect to throw some of them out after you've finished using them.\n"
        ;;
        "2" | 2)
        printf "${DARK_BLUE_16_fg}Peter H. Salus ${DARK_YELLOW_16_fg}Philosophy${NOCOLOR_16_fg}:\n\t1. Write programs that do one thing and do it well.\n\t2. Write programs to work together.\n\t3. Write programs to handle text streams, because that is a universal interface.\n"
        ;;
        "3" | 3)
        printf "${DARK_BLUE_16_fg}Eric Raymond ${DARK_YELLOW_16_fg}Philosophy${NOCOLOR_16_fg}:\n\t1. Build modular programs.\n\t2. Write readable programs.\n\t3. Use composition.\n\t4. Separate mechanisms from policy.\n\t5. Write simple programs.\n\t6. Write small programs.\n\t7. Write transparent programs.\n\t8. Write robust programs.\n\t9. Make data complicated when required, not the program.\n\t10. Build on potential users' expected knowledge.\n\t11. Avoid unnecessary output.\n\t12. Write programs which fail in a way that is easy to diagnose.\n\t13. Value developer time over machine time.\n\t14. Write abstract programs that generate code instead of writing code by hand.\n\t15. Prototype software before polishing it.\n\t16. Write flexible and open programs.\n\t17. Make the program and protocols extensible.\n"
        ;;
        "4" | 4)
        printf "${DARK_BLUE_16_fg}Mike Gancarz ${DARK_YELLOW_16_fg}Philosophy${NOCOLOR_16_fg}:\n\t1. Small is beautiful.\n\t2. Make each program do one thing well.\n\t3. Build a prototype as soon as possible.\n\t4. Choose portability over efficiency.\n\t5. Store data in flat text files.\n\t6. Use software leverage to your advantage.\n\t7. Use shell scripts to increase leverage and portability.\n\t8. Avoid captive user interfaces.\n\t10. Make every program a filter.\n"
        ;;
        *)
        printf "${DARK_RED_16_fg}Invalid input, try again${NOCOLOR_16_fg}\n"
        ;;
    esac
    }
    bash -c "$(declare -f _telmtp); _telmtp"
}

function genpasswd() {
#    < /dev/urandom tr -dc _A-Z-a-z-0-9 | head -c${1:-$1};echo;
    < /dev/urandom tr -dc @#%\&+=_A-Z-a-z-0-9 | head -c${1:-$1};echo;

}

function gitcmt() {
    git add "$1"
    git commit -m "$2"
    git push
}

function replaceline() {
    sed -i "$1s/.*/$2/" $3
}

function sysman() {
    function poptions() {
        printf "%s\n" "Options:"
        printf "${DARK_BLUE_16_fg}1${NOCOLOR_16_fg}. Update/Refresh Pacman Mirrors\n"
        printf "${DARK_BLUE_16_fg}2${NOCOLOR_16_fg}. Update System\n"
        printf "${DARK_BLUE_16_fg}3${NOCOLOR_16_fg}. Refresh the Database\n"
        printf "${DARK_BLUE_16_fg}4${NOCOLOR_16_fg}. Clear Cache\n"
        printf "${DARK_BLUE_16_fg}5${NOCOLOR_16_fg}. Clear Unused/Orphans Packages\n"
        printf "${DARK_BLUE_16_fg}6${NOCOLOR_16_fg}. Clear Lost Files\n"
        printf "${DARK_BLUE_16_fg}7${NOCOLOR_16_fg}. List Packages (Date/Size)\n"
        printf "${DARK_BLUE_16_fg}8${NOCOLOR_16_fg}. Clear The System\n"
        printf "${DARK_BLUE_16_fg}0${NOCOLOR_16_fg}. Exit\n"

    }
    function upmirrors() {
        if [[ $(id -u ) -ne 0 ]]; then
            printf "%s\n" "Please run as sudo"
        else
            if [[ -e /etc/pacman.d/mirrorlist ]]; then
                rm /etc/pacman.d/mirrorlist
                while IFS="" read -r p || [ -n "$p" ]; do
                    printf "%s\n" "${p##\#}" >> /etc/pacman.d/mirrorlist
                done <<< $(curl https://archlinux.org/mirrorlist/all/)
            else
                while IFS="" read -r p || [ -n "$p" ]; do
                    printf "%s\n" "${p##\#}" >> /etc/pacman.d/mirrorlist
                done <<< $(curl https://archlinux.org/mirrorlist/all/)
            fi
        fi
    }
    function refreshdatabase() {
        printf "%s\n" "Refreshing the database"
        if [[ -e $(which yay) ]]; then
            sudo sh -c "pacman -Fy"
            printf "%s\n" "AUR Helper (yay) found, refreshing it's database as well"
            yay -Fy
        else
            sudo sh -c "pacman -Fy"
        fi
    }
    function clearcache() {
        printf "%s\n" "This will clear the pacman cache and the user home cache"
        printf "%s\n" "clearing pacman cache"
        if [[ -e $(which paccache) ]]; then
            printf "%s\n" "paccache found"
            echo -e -n "Do you wish to ${DARK_BLUE_16_fg}p${NOCOLOR_16_fg}urge all the files in pacman cache or ${DARK_PURPLE_16_fg}k${NOCOLOR_16_fg}eep only the last version (${DARK_BLUE_16_fg}p${NOCOLOR_16_fg}/${DARK_PURPLE_16_fg}k${NOCOLOR_16_fg})? "
            old_stty_cfg=$(stty -g)
            stty raw -echo
            answer=$( while ! head -c 1 | grep -i '[kp]' ;do true ;done )
            stty $old_stty_cfg
            if echo "$answer" | grep -iq "^p" ;then
                printf "${DARK_RED_16_fg}Purging cache${NOCOLOR_16_fg}\n"
                sudo sh -c "pacman -Scc"
            else
                printf "${DARK_RED_16_fg}Keeping last version${NOCOLOR_16_fg}\n"
                paccache -rk1
            fi
        else
            echo -e -n "Do you wish to purge all files in pacman cache (${DARK_GREEN_16_fg}y${NOCOLOR_16_fg}/${DARK_RED_16_fg}n${NOCOLOR_16_fg})? "
            old_stty_cfg=$(stty -g)
            stty raw -echo
            answer=$( while ! head -c 1 | grep -i '[ny]' ;do true ;done )
            stty $old_stty_cfg
            if echo "$answer" | grep -iq "^y" ;then
                printf "${DARK_GREEN_16_fg}Removing Packages${NOCOLOR_16_fg}\n"
                sudo sh -c "pacman -Scc"
            else
                printf "%s\n" "passing"
            fi
        fi
        printf "%s\n" "clearing user home cache"
        rm -rf $HOME/.cache/*
    }
    function upsys() {
        printf "%s\n" "Updating the system, the mirrors and refreshing the database"
        if [[ -e $(which yay) ]]; then
            sudo sh -c "$(declare -f upmirrors); upmirrors; pacman -Fy && pacman -Syu"
            printf "%s\n" "AUR Helper (yay) found, updating any AUR packages"
            yay -Syu
        else
            sudo sh -c "$(declare -f upmirrors); upmirrors; pacman -Fy && pacman -Syu"
        fi
    }
    function clearPackages() {
        printf "%s\n" "Removing Unused/Ophans Packages"
        if [[ -e $(which yay) ]]; then
            printf "%s\n" "This will remove the following packages:"
            yay -Qtdq
            echo -e -n "Do you wish to proceed (${DARK_GREEN_16_fg}y${NOCOLOR_16_fg}/${DARK_RED_16_fg}n${NOCOLOR_16_fg})? "
            old_stty_cfg=$(stty -g)
            stty raw -echo
            answer=$( while ! head -c 1 | grep -i '[ny]' ;do true ;done )
            stty $old_stty_cfg
            if echo "$answer" | grep -iq "^y" ;then
                printf "${DARK_GREEN_16_fg}Removing Packages${NOCOLOR_16_fg}\n"
                yay -Qtdq | sudo yay -Rns -
            else
                printf "%s\n" "passing"
            fi
        else
            printf "%s\n" "This will remove the following packages:"
            sudo sh -c "pacman -Qtdq"
            echo -e -n "Do you wish to proceed (${DARK_GREEN_16_fg}y${NOCOLOR_16_fg}/${DARK_RED_16_fg}n${NOCOLOR_16_fg})? "
            old_stty_cfg=$(stty -g)
            stty raw -echo
            answer=$( while ! head -c 1 | grep -i '[ny]' ;do true ;done )
            stty $old_stty_cfg
            if echo "$answer" | grep -iq "^y" ;then
                printf "${DARK_GREEN_16_fg}Removing Packages${NOCOLOR_16_fg}\n"
                sudo sh -c "pacman -Qtdq | sudo pacman -Rns -"
            else
                printf "%s\n" "passing"
            fi
        fi
    }
    function listPackagesDS() {
        function listPackagesDate() {
            for i in $(pacman -Qq); do
                grep "\[ALPM\] installed $i" /var/log/pacman.log
            done | sort -u | sed -e 's/\[ALPM\] installed //' -e 's/(.*$//'
        }
        function listPackagesSize() {
            LC_ALL=C pacman -Qi | awk '/^Name/{name=$3} /^Installed Size/{print $4$5, name}' | sort -h
        }
        printf "%s\n" "Listing Packages"
        printf "%s\n" "Options:"
        printf "${DARK_BLUE_16_fg}1${NOCOLOR_16_fg}. Date\n"
        printf "${DARK_BLUE_16_fg}2${NOCOLOR_16_fg}. Size\n"
        printf "${DARK_BLUE_16_fg}0${NOCOLOR_16_fg}. Go Back to Main Menu\n"
        printf "Select your option? "
        while :; do
            read OPT
            case $OPT in
                1)
                    echo -e -n "Do you want to ${DARK_BLUE_16_fg}p${NOCOLOR_16_fg}rint or ${DARK_PURPLE_16_fg}s${NOCOLOR_16_fg}ave to file (${DARK_BLUE_16_fg}p${NOCOLOR_16_fg}/${DARK_PURPLE_16_fg}s${NOCOLOR_16_fg})? "
                    old_stty_cfg=$(stty -g)
                    stty raw -echo
                    answer=$( while ! head -c 1 | grep -i '[sp]' ;do true ;done )
                    stty $old_stty_cfg
                    if echo "$answer" | grep -iq "^p" ;then
                        clear
                        printf "%s\n" "Printing"
                        listPackagesDate
                    else
                        printf "%s\n" "Saving to $HOME/packagesDate_$(date +'%F')"
                        listPackagesDate > $HOME/packagesDate_$(date +'%F')
                        clear
                    fi
                ;;
                2)
                    echo -e -n "Do you want to ${DARK_BLUE_16_fg}p${NOCOLOR_16_fg}rint or ${DARK_PURPLE_16_fg}s${NOCOLOR_16_fg}ave to file (${DARK_BLUE_16_fg}p${NOCOLOR_16_fg}/${DARK_PURPLE_16_fg}s${NOCOLOR_16_fg})? "
                    old_stty_cfg=$(stty -g)
                    stty raw -echo
                    answer=$( while ! head -c 1 | grep -i '[sp]' ;do true ;done )
                    stty $old_stty_cfg
                    if echo "$answer" | grep -iq "^p" ;then
                        clear
                        printf "%s\n" "Printing"
                        listPackagesSize
                    else
                        printf "%s\n" "Saving to $HOME/packagesSize_$(date +'%F')"
                        listPackagesSize > $HOME/packagesSize_$(date +'%F')
                        clear
                    fi
                ;;
                0)
                    clear
                    break
                ;;
                *)
                    clear
                    printf "%s\n" "Invalid Input"
                ;;
            esac
            printf "${DARK_BLUE_16_fg}1${NOCOLOR_16_fg}. Date\n"
            printf "${DARK_BLUE_16_fg}2${NOCOLOR_16_fg}. Size\n"
            printf "${DARK_BLUE_16_fg}0${NOCOLOR_16_fg}. Go Back to Main Menu\n"
            printf "Select your option? "
        done
    }
    function clearLostFiles() {
        printf "%s\n" "clearing lost files (may take a long time to finish)"
        sudo find /etc /usr /opt | LC_ALL=C sudo pacman -Qqo - 2>&1 >&- >/dev/null | cut -d ' ' -f 5-
    }
    function clearSystem() {
        printf "${DARK_GREEN_16_fg}Clearing the System${NOCOLOR_16_fg}\n"
        printf "%s\n" "This will do the folowing steps:"
        printf "${DARK_BLUE_16_fg}1${NOCOLOR_16_fg}. Purge Unused Packages\n"
        printf "${DARK_BLUE_16_fg}2${NOCOLOR_16_fg}. Clear the Pacman Cache\n"
        printf "${DARK_BLUE_16_fg}3${NOCOLOR_16_fg}. Clear the User Home Cache\n"
        printf "${DARK_BLUE_16_fg}4${NOCOLOR_16_fg}. Clear Lost Files (may take a long time to finish)\n"
        echo -e -n "Do you wish to proceed (${DARK_GREEN_16_fg}y${NOCOLOR_16_fg}/${DARK_RED_16_fg}n${NOCOLOR_16_fg})? "
        old_stty_cfg=$(stty -g)
        stty raw -echo
        answer=$( while ! head -c 1 | grep -i '[ny]' ;do true ;done )
        stty $old_stty_cfg
        if echo "$answer" | grep -iq "^y" ;then
            printf "${DARK_GREEN_16_fg}Clearing the Clutter${NOCOLOR_16_fg}\n"
            clearPackages
            clearcache
            echo -e -n "Do you wish to Clear Lost Files (may take a long time to finish) (${DARK_GREEN_16_fg}y${NOCOLOR_16_fg}/${DARK_RED_16_fg}n${NOCOLOR_16_fg})? "
            old_stty_cfg=$(stty -g)
            stty raw -echo
            answer=$( while ! head -c 1 | grep -i '[ny]' ;do true ;done )
            stty $old_stty_cfg
            if echo "$answer" | grep -iq "^y" ;then
                printf "${DARK_GREEN_16_fg}Clearing the Clutter${NOCOLOR_16_fg}\n"
                clearLostFiles
            else
                printf "%s\n" "passing"
            fi
        else
            printf "%s\n" "passing"
        fi
    }


    clear
    printf "%s\n" "Welcome to the System Manager Function (SysMan)"
    printf "%s\n" "This function exists to help you manage your ArchLinux System"
    poptions
    printf "What you want to do? "
    while :; do
        read OPT
        case $OPT in
        1)
            clear
            printf "%s\n" "Updating mirrors from https://archlinux.org/mirrorlist/all/"
            sudo sh -c "$(declare -f upmirrors); upmirrors"
            printf "All the mirrors are ${DARK_GREEN_16_fg}UP TO DATE${NOCOLOR_16_fg}\n"
            echo -e -n "Do you wanna refresh the Database (${DARK_GREEN_16_fg}y${NOCOLOR_16_fg}/${DARK_RED_16_fg}n${NOCOLOR_16_fg})? "
            old_stty_cfg=$(stty -g)
            stty raw -echo
            answer=$( while ! head -c 1 | grep -i '[ny]' ;do true ;done )
            stty $old_stty_cfg
            if echo "$answer" | grep -iq "^y" ;then
                printf "${DARK_GREEN_16_fg}refreshing the database${NOCOLOR_16_fg}\n"
                refreshdatabase
            else
                printf "%s\n" "passing"
            fi
        ;;
        2)
            clear
            upsys
        ;;
        3)
            clear
            refreshdatabase
        ;;
        4)
            clear
            clearcache
        ;;
        5)
            clear
            clearPackages
        ;;
        6)
            clear
            clearLostFiles
        ;;
        7)
            clear
            listPackagesDS
        ;;
        8)
            clear
            clearSystem
        ;;
        0)
            printf "%s\n" "quit"
            break
        ;;
        *)
            clear
            printf "%s\n" "Invalid Input"
        ;;
        esac
        clear
        printf "%s\n" "Welcome to the System Manager Function (SysMan)"
        printf "%s\n" "This function exists to help you manage your ArchLinux System"
        poptions
        printf "What you want to do? "
    done
}