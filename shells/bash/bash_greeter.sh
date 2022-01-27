BOLD='\e[1m'
RESET='\e[m'
RED='\e[31m'

shopt -s checkwinsize; (:;:)
[[ $COLUMNS -lt 67 ]] && exit 0

greeter() {
    ln0="S I N C E       S E P T E M B E R       1 9 9 1"
    ln1="######      ########  #####    ###### ####    #### ######  ######"
    ln2="######      ########  #####    ###### ####    #### ######  ######"
    ln3=" ####         ####    ######    ####  ####    ####   #########   "
    ln4=" ####         ####    #######   ####  ####    ####    #######    "
    ln5=" ####         ####    ########  ####  ####    ####    ########   "
    ln6=" ####    ##   ####    #### #### ####  ####    ####   ##########  "
    ln7="########### ######## ###### ########  ############ ######  ######"
    ln8="########### ######## ######  #######   ##########  ######  ######"
    ln9="T H E         G N U         O P E R A T I N G         S Y S T E M"
    #ln9="G  N  U       O  P  E  R  A  T  I  N  G       S  Y  S  T  E  M"

    SLEEPTIME=0.25

    sleep $SLEEPTIME
    printf "${BOLD}%*s${RESET}\n" $(((${#ln0}+$COLUMNS)/2)) "$ln0"
    sleep $SLEEPTIME
    printf "${RED}%*s\n" $(((${#ln1}+$COLUMNS)/2)) "$ln1"
    sleep $SLEEPTIME
    printf "${RED}%*s\n" $(((${#ln2}+$COLUMNS)/2)) "$ln2"
    sleep $SLEEPTIME
    printf "${RED}%*s\n" $(((${#ln3}+$COLUMNS)/2)) "$ln3"
    sleep $SLEEPTIME
    printf "${RED}%*s\n" $(((${#ln4}+$COLUMNS)/2)) "$ln4"
    sleep $SLEEPTIME
    printf "${RED}%*s\n" $(((${#ln5}+$COLUMNS)/2)) "$ln5"
    sleep $SLEEPTIME
    printf "${RED}%*s\n" $(((${#ln6}+$COLUMNS)/2)) "$ln6"
    sleep $SLEEPTIME
    printf "${RED}%*s\n" $(((${#ln7}+$COLUMNS)/2)) "$ln7"
    sleep $SLEEPTIME
    printf "${RED}%*s${RESET}\n" $(((${#ln8}+$COLUMNS)/2)) "$ln8"
    sleep $SLEEPTIME
    printf "${BOLD}%*s${RESET}\n" $(((${#ln9}+$COLUMNS)/2)) "$ln9"
    # exit 0
}

#greeter

#region ORIGINAL from: https://github.com/SwiftyChicken/dotfiles/blob/master/.local/bin/greet_linux.sh
# printf "${TITLE1}${BOLD}                  自  由  ソ  フ  ト  ウ  ェ  ア                   ${RESET}\n"
# printf "${RED} ######      ########  ####     ###### ####    #### ######  ###### \n"
# printf "${RED} ######      ########  #####    ###### ####    #### ######  ###### \n"
# printf "${RED}  ####         ####    ######    ####  ####    ####   #########    \n"
# printf "${RED}  ####         ####    #######   ####  ####    ####    #######     \n"
# printf "${RED}  ####         ####    ########  ####  ####    ####    ########    \n"
# printf "${RED}  ####    ##   ####    #### #### ####  ####    ####   ##########   \n"
# printf "${RED} ########### ######## ###### ########  ############ ######  ###### \n"
# printf "${RED} ########### ######## ######  #######   ##########  ######  ###### ${RESET}\n"
# printf "${TITLE2}${BOLD}  G  N  U       O  P  E  R  A  T  I  N  G       S  Y  S  T  E  M   ${RESET}\n\n"
# shopt -s checkwinsize; (:;:) && printf "${COLUMNS}\n"
#endregion
