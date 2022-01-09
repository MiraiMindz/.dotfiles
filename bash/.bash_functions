if [[ -e $HOME/.bash_aliases ]]; then
    source $HOME/.bash_aliases
fi

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

initgit() {
    git init -b main && git add . && git commit -m "First commit" && git remote add origin "$1" && git remote -v && git push origin main
}

tellmethephilosophy() {
    printf "Please select which interpretation of the ${DARK_YELLOW}Unix Philosophy${NOCOLOR} you wanna see:\n0. ${DARK_GREEN}Dennis Ritchie & Ken Thompson${NOCOLOR}\n1. ${DARK_GREEN}Doug McIlroy${NOCOLOR}\n2. ${DARK_GREEN}Peter H. Salus${NOCOLOR}\n3. ${DARK_GREEN}Eric Raymond${NOCOLOR}\n4. ${DARK_GREEN}Mike Gancarz${NOCOLOR}\n"
    read -e -p "Enter your numeric choice: " PHILOSOPHY
    case $PHILOSOPHY in
        "0" | 0)
        printf "${DARK_BLUE}Dennis Ritchie & Ken Thompson ${DARK_YELLOW}Philosophy${NOCOLOR}:\n\t1. Make it easy to write, test, and run programs.\n\t2. Interactive use instead of batch processing.\n\t3. Economy and elegance of design due to size constraints (\"salvation through suffering\").\n\t4. Self-supporting system: all Unix software is maintained under Unix.\n"
        ;;
        "1" | 1)
        printf "${DARK_BLUE}Doug McIlroy ${DARK_YELLOW}Philosophy${NOCOLOR}:\n\t1. Make each program do one thing well. To do a new job, build afresh rather than complicate old programs by adding new \"features\".\n\t2. Expect the output of every program to become the input to another, as yet unknown, program. Don't clutter output with extraneous information.\n\t   Avoid stringently columnar or binary input formats. Don't insist on interactive input.\n\t3. Design and build software, even operating systems, to be tried early, ideally within weeks. Don't hesitate to throw away the clumsy parts and rebuild them.\n\t4. Use tools in preference to unskilled help to lighten a programming task\n\t   even if you have to detour to build the tools and expect to throw some of them out after you've finished using them.\n"
        ;;
        "2" | 2)
        printf "${DARK_BLUE}Peter H. Salus ${DARK_YELLOW}Philosophy${NOCOLOR}:\n\t1. Write programs that do one thing and do it well.\n\t2. Write programs to work together.\n\t3. Write programs to handle text streams, because that is a universal interface.\n"
        ;;
        "3" | 3)
        printf "${DARK_BLUE}Eric Raymond ${DARK_YELLOW}Philosophy${NOCOLOR}:\n\t1. Build modular programs.\n\t2. Write readable programs.\n\t3. Use composition.\n\t4. Separate mechanisms from policy.\n\t5. Write simple programs.\n\t6. Write small programs.\n\t7. Write transparent programs.\n\t8. Write robust programs.\n\t9. Make data complicated when required, not the program.\n\t10. Build on potential users' expected knowledge.\n\t11. Avoid unnecessary output.\n\t12. Write programs which fail in a way that is easy to diagnose.\n\t13. Value developer time over machine time.\n\t14. Write abstract programs that generate code instead of writing code by hand.\n\t15. Prototype software before polishing it.\n\t16. Write flexible and open programs.\n\t17. Make the program and protocols extensible.\n"
        ;;
        "4" | 4)
        printf "${DARK_BLUE}Mike Gancarz ${DARK_YELLOW}Philosophy${NOCOLOR}:\n\t1. Small is beautiful.\n\t2. Make each program do one thing well.\n\t3. Build a prototype as soon as possible.\n\t4. Choose portability over efficiency.\n\t5. Store data in flat text files.\n\t6. Use software leverage to your advantage.\n\t7. Use shell scripts to increase leverage and portability.\n\t8. Avoid captive user interfaces.\n\t10. Make every program a filter.\n"
        ;;
        *)
        printf "${DARK_RED}Invalid input, try again${NOCOLOR}\n"
        ;;
    esac
}

genpasswd() {
#    < /dev/urandom tr -dc _A-Z-a-z-0-9 | head -c${1:-$1};echo;
    < /dev/urandom tr -dc @#%\&+=_A-Z-a-z-0-9 | head -c${1:-$1};echo;
}

