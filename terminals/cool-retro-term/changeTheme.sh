### Text Styles
DARK_BLACK='\e[30m'
DARK_RED='\e[31m'
DARK_GREEN='\e[32m'
DARK_YELLOW='\e[33m'
DARK_BLUE='\e[34m'
DARK_PURPLE='\e[35m'
DARK_CYAN='\e[36m'
DARK_WHITE='\e[37m'
LIGHT_BLACK='\e[90m'
LIGHT_RED='\e[91m'
LIGHT_GREEN='\e[92m'
LIGHT_YELLOW='\e[93m'
LIGHT_BLUE='\e[94m'
LIGHT_PURPLE='\e[95m'
LIGHT_CYAN='\e[96m'
LIGHT_WHITE='\e[97m'
TEXTBOLD_ON='\e[1m'
TEXTFAINT_ON='\e[2m'
TEXTITALIC_ON='\e[3m'
TEXTUNDERLN_ON='\e[4m'
TEXTBLINK_ON='\e[5m'
TEXTHIGHLT_ON='\e[7m'
TEXTHIDDEN_ON='\e[8m'
TEXTSTRIKE_ON='\e[9m'
TEXTBOLD_OFF='\e[21m'
TEXTFAINT_OFF='\e[22m'
TEXTITALIC_OFF='\e[23m'
TEXTUNDERLN_OFF='\e[24m'
TEXTBLINK_OFF='\e[25m'
TEXTHIGHLT_OFF='\e[27m'
TEXTHIDDEN_OFF='\e[28m'
TEXTSTRIKE_OFF='\e[29m'
NOCOLOR='\e[39m'
TEXTRESETALL='\e[m'

changeTheme() {
    if [[ -e /usr/lib/qt/qml/QMLTermWidget/color-schemes/cool-retro-term.colorscheme ]]; then
        sudo rm /usr/lib/qt/qml/QMLTermWidget/color-schemes/cool-retro-term.colorscheme
        printf "Please select one of these ${GREEN}themes${NOCOLOR}:\n"
        printf "${GREEN}0${NOCOLOR}. Default\n"
        printf "${GREEN}1${NOCOLOR}. Dracula\n"
        printf "${GREEN}2${NOCOLOR}. MaterialOcean\n"
        printf "${GREEN}3${NOCOLOR}. Nord\n"
        read -e -p "Enter the number: " CHOICE
        case $CHOICE in
        "0" | 0)
        sudo ln -sf $HOME/.dotfiles/terminals/cool-retro-term/Themes/default.colorscheme /usr/lib/qt/qml/QMLTermWidget/color-schemes/cool-retro-term.colorscheme
        ;;
        "1" | 1)
        sudo ln -sf $HOME/.dotfiles/terminals/cool-retro-term/Themes/Dracula.colorscheme /usr/lib/qt/qml/QMLTermWidget/color-schemes/cool-retro-term.colorscheme
        ;;
        "2" | 2)
        sudo ln -sf $HOME/.dotfiles/terminals/cool-retro-term/Themes/MaterialThemeOcean.colorscheme /usr/lib/qt/qml/QMLTermWidget/color-schemes/cool-retro-term.colorscheme
        ;;
        "3" | 3)
        sudo ln -sf $HOME/.dotfiles/terminals/cool-retro-term/Themes/Nord.colorscheme /usr/lib/qt/qml/QMLTermWidget/color-schemes/cool-retro-term.colorscheme
        ;;
        *)
        printf "${RED}Invalid input, try again${NOCOLOR}\n"
        ;;
        esac
    fi
    exec cool-retro-term &
    exit
}

changeTheme



