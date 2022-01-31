exitstatus() {
    if [[ $? == 0 ]]; then
        printf '\e[92m⬤ \e[39m'
    else
        printf '\e[31m⬤ \e[39m'
    fi
}

EXTSTS='\[$(printf $DARK_BLACK_16_fg)\]\[$( printf $DARK_BLACK_16_bg)\]$(exitstatus)'
TM1='\[$(printf $DARK_YELLOW_16_fg)\][\t]\[$(printf $NOCOLOR_16_fg)\]'
UWD1='\[$(printf $DARK_BLUE_16_fg)\]\u\[$(printf $NOCOLOR_16_fg)\]@\[$(printf $DARK_PURPLE_16_fg)\]\W'
IDCTR1='\[$(printf $DARK_GREEN_16_fg)\]~\[$(printf $NOCOLOR_16_fg)\]'
GT1='\[$(printf $DARK_RED_16_fg)\]$(__git_ps1 " (%s)")'
JBS1='\j '
TM2='\[$(printf $DARK_YELLOW_16_fg)\]\[$(printf $DARK_YELLOW_16_bg)$(printf $DARK_BLACK_16_fg)\]\t\[$(printf $NOCOLOR_16_bg)\]\[$(printf $DARK_YELLOW_16_fg)\]\[$(printf $NOCOLOR_16_fg)\]'
UWD2='\[$(printf $DARK_BLUE_16_fg)\]\[$(printf $DARK_BLUE_16_bg)$(printf $DARK_BLACK_16_fg)\]\u\[$(printf $DARK_PURPLE_16_fg)\]\[$(printf $DARK_PURPLE_16_bg)$(printf $DARK_BLACK_16_fg)\]\W\[$(printf $NOCOLOR_16_bg)\]\[$(printf $DARK_PURPLE_16_fg)\]\[$(printf $NOCOLOR_16_fg)\]'
IDCTR2='\[$(printf $DARK_GREEN_16_fg)\]\[$(printf $DARK_GREEN_16_bg)$(printf $DARK_BLACK_16_fg)\]~\[$(printf $NOCOLOR_16_bg)$(printf $DARK_GREEN_16_fg)\]\[$(printf $NOCOLOR_16_fg)\]'
GT2='$(__git_ps1 " \[$(printf $DARK_RED_16_fg)\]\[$(printf $DARK_RED_16_bg)$(printf $DARK_BLACK_16_fg)\]%s\[$(printf $NOCOLOR_16_bg)\]\[$(printf $DARK_RED_16_fg)\]\[$(printf $NOCOLOR_16_fg)\]")'
TM3='\[$(printf $DARK_YELLOW_16_fg)\]\[$(printf $DARK_YELLOW_16_bg)$(printf $DARK_BLACK_16_fg)\]\t\[$(printf $DARK_YELLOW_16_bg)\]\[$(printf $NOCOLOR_16_fg)\]'
UWD3='\[$(printf $DARK_BLUE_16_fg)\]\[$(printf $DARK_BLUE_16_bg)$(printf $DARK_BLACK_16_fg)\]\u\[$(printf $DARK_PURPLE_16_fg)\]\[$(printf $DARK_PURPLE_16_bg)$(printf $DARK_BLACK_16_fg)\]\W\[$(printf $DARK_PURPLE_16_bg)\]\[$(printf $NOCOLOR_16_fg)\]'
IDCTR3='\[$(printf $NOCOLOR_16_bg)\]\[$(printf $NOCOLOR_16_fg)\]'
GT3='$(__git_ps1 "\[$(printf $DARK_RED_16_fg)\]\[$(printf $DARK_RED_16_bg)$(printf $DARK_BLACK_16_fg)\]%s\[$(printf $DARK_RED_16_bg)\]\[$(printf $NOCOLOR_16_fg)\]")'
TM4='\[$(printf $DARK_YELLOW_16_fg)\]\[$(printf $DARK_YELLOW_16_bg)$(printf $DARK_BLACK_16_fg)\]\t\[$(printf $DARK_YELLOW_16_bg)\]\[$(printf $NOCOLOR_16_fg)\]'
UWD4='\[$(printf $DARK_BLUE_16_fg)\]\[$(printf $DARK_BLUE_16_bg)$(printf $DARK_BLACK_16_fg)\]\u\[$(printf $DARK_PURPLE_16_fg)\]\[$(printf $DARK_PURPLE_16_bg)$(printf $DARK_BLACK_16_fg)\]\W\[$(printf $DARK_PURPLE_16_bg)$(printf $DARK_PURPLE_16_fg)\]'
GT4='$(__git_ps1 "\[$(printf $DARK_RED_16_fg)\]\[$(printf $DARK_RED_16_bg)$(printf $DARK_BLACK_16_fg)\]%s\[$(printf $DARK_RED_16_bg)$(printf $DARK_RED_16_fg)\]")'


# To make the Powerline variants work, you will need to set the terminal font to 12px, and use any supported Powerline font

if [ -e $HOME/.bash/git-prompt.sh ]; then
    GIT_PS1_SHOWDIRTYSTATE=1
    GIT_PS1_SHOWSTASHSTATE=1
    GIT_PS1_SHOWUNTRACKEDFILES=1
    GIT_PS1_SHOWCOLORHINTS=1
    GIT_PS1_SHOWUPSTREAM="auto"
    GIT_PS1_DESCRIBE_STYLE="branch"

    #PS1="${TM1} ${UWD1}${GT1} ${IDCTR1} " # Base PS1 no Powerline | 0
    #PS1="${TM2} ${UWD2}${GT2} ${IDCTR1} " # Base PS1 with Powerline | 1
    #PS1="${TM3}${UWD3}${GT3}${IDCTR2} " # Base PS1 full Powerline | 2
    PS1="${EXTSTS}${JBS1}${TM4}${UWD4}${GT4}${IDCTR3} " # Extended PS1 full Powerline | 3
    PS2="${EXTSTS}${JBS1}${GT4}${IDCTR3} "
else
    PS1="${TM2} ${UWD2} ${IDCTR1} "
    PS2="└ ${IDCTR1} "
fi

