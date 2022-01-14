if [[ -e $HOME/.bash_aliases ]]; then
    source $HOME/.bash_aliases
fi

BLACK='\e[0;30m'
RED='\e[0;31m'
GREEN='\e[0;32m'
ORANGE='\e[0;33m'
BLUE='\e[0;34m'
PURPLE='\e[0;35m'
CYAN='\e[0;36m'
GRAY='\e[0;37m'
LBLACK='\e[1;30m'
LRED='\e[1;31m'
LGREEN='\e[1;32m'
YELLOW='\e[1;33m'
LBLUE='\e[1;34m'
LPURPLE='\e[1;35m'
LCYAN='\e[1;36m'
WHITE='\e[1;37m'
NOCOLOR='\e[0m'

shreddir() {
find $1 -type f -exec shred -n 30 -v -u {} \;
rmdir $1
}

cl() {
    DIR="$*";
        # if no DIR given, go home
        if [ $# -lt 1 ]; then
                DIR=$HOME;
    fi;
    builtin cd "${DIR}" && \
    # use your preferred ls command
        la
}

gorun () {
    if [[ $(which go) ]];then
        go fmt $1
        go run $1
    fi
}

initgit() {
    git init -b main && git add . && git commit -m "First commit" && git remote add origin "$1" && git remote -v && git push origin main
}

tellmethephilosophy() {
    printf "Please select which interpretation of the ${ORANGE}Unix Philosophy${NOCOLOR} you wanna see:\n0. ${GREEN}Dennis Ritchie & Ken Thompson${NOCOLOR}\n1. ${GREEN}Doug McIlroy${NOCOLOR}\n2. ${GREEN}Peter H. Salus${NOCOLOR}\n3. ${GREEN}Eric Raymond${NOCOLOR}\n4. ${GREEN}Mike Gancarz${NOCOLOR}\n"
    read -e -p "Enter your numeric choice: " PHILOSOPHY
    case $PHILOSOPHY in
        "0" | 0)
        printf "${BLUE}Dennis Ritchie & Ken Thompson ${ORANGE}Philosophy${NOCOLOR}:\n\t1. Make it easy to write, test, and run programs.\n\t2. Interactive use instead of batch processing.\n\t3. Economy and elegance of design due to size constraints (\"salvation through suffering\").\n\t4. Self-supporting system: all Unix software is maintained under Unix.\n"
        ;;
        "1" | 1)
        printf "${BLUE}Doug McIlroy ${ORANGE}Philosophy${NOCOLOR}:\n\t1. Make each program do one thing well. To do a new job, build afresh rather than complicate old programs by adding new \"features\".\n\t2. Expect the output of every program to become the input to another, as yet unknown, program. Don't clutter output with extraneous information.\n\t   Avoid stringently columnar or binary input formats. Don't insist on interactive input.\n\t3. Design and build software, even operating systems, to be tried early, ideally within weeks. Don't hesitate to throw away the clumsy parts and rebuild them.\n\t4. Use tools in preference to unskilled help to lighten a programming task\n\t   even if you have to detour to build the tools and expect to throw some of them out after you've finished using them.\n"
        ;;
        "2" | 2)
        printf "${BLUE}Peter H. Salus ${ORANGE}Philosophy${NOCOLOR}:\n\t1. Write programs that do one thing and do it well.\n\t2. Write programs to work together.\n\t3. Write programs to handle text streams, because that is a universal interface.\n"
        ;;
        "3" | 3)
        printf "${BLUE}Eric Raymond ${ORANGE}Philosophy${NOCOLOR}:\n\t1. Build modular programs.\n\t2. Write readable programs.\n\t3. Use composition.\n\t4. Separate mechanisms from policy.\n\t5. Write simple programs.\n\t6. Write small programs.\n\t7. Write transparent programs.\n\t8. Write robust programs.\n\t9. Make data complicated when required, not the program.\n\t10. Build on potential users' expected knowledge.\n\t11. Avoid unnecessary output.\n\t12. Write programs which fail in a way that is easy to diagnose.\n\t13. Value developer time over machine time.\n\t14. Write abstract programs that generate code instead of writing code by hand.\n\t15. Prototype software before polishing it.\n\t16. Write flexible and open programs.\n\t17. Make the program and protocols extensible.\n"
        ;;
        "4" | 4)
        printf "${BLUE}Mike Gancarz ${ORANGE}Philosophy${NOCOLOR}:\n\t1. Small is beautiful.\n\t2. Make each program do one thing well.\n\t3. Build a prototype as soon as possible.\n\t4. Choose portability over efficiency.\n\t5. Store data in flat text files.\n\t6. Use software leverage to your advantage.\n\t7. Use shell scripts to increase leverage and portability.\n\t8. Avoid captive user interfaces.\n\t10. Make every program a filter.\n"
        ;;
        *)
        printf "${RED}Invalid input, try again${NOCOLOR}\n"
        ;;
    esac
}

genpasswd() {
#    < /dev/urandom tr -dc _A-Z-a-z-0-9 | head -c${1:-$1};echo;
    < /dev/urandom tr -dc @#%\&+=_A-Z-a-z-0-9 | head -c${1:-$1};echo;

}

hwinfo() {
    shopt -s checkwinsize; (:;:)
    cpuln="================================ CPU ================================"
    memln="================================ MEMORY ================================"
    diskln="================================ DISK ================================"
    netln="================================ NET ================================"
    printf "${RED}\n%*s\n\n${NOCOLOR}" $(((${#cpuln}+$COLUMNS)/2)) "$cpuln"
    cpuinfo
    printf "${RED}\n%*s\n\n${NOCOLOR}" $(((${#memln}+$COLUMNS)/2)) "$memln"
    meminfo -w
    printf "${RED}\n%*s\n\n${NOCOLOR}" $(((${#diskln}+$COLUMNS)/2)) "$diskln"
    lsblk -o "NAME,MAJ:MIN,RM,SIZE,RO,FSTYPE,MOUNTPOINT,UUID"
    printf "${RED}\n%*s\n\n${NOCOLOR}" $(((${#netln}+$COLUMNS)/2)) "$netln"
    ip ad show
    printf "\n"
}

secedit() {
    _secureedit() {
        trap '' INT
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

twitchfetch() {
    _randArr() {
        shopt -s nullglob
        local arr=("$@")
        neofetch --ascii "${arr[RANDOM % $#]}"
    }
    arr2=($HOME/.config/neofetch/asciiArts/*)
    _randArr "${arr2[@]}"
}
