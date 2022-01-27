exitstatus() {
    if [[ $? == 0 ]]; then
        printf '\e[92m⬤ \e[39m'
    else
        printf '\e[31m⬤ \e[39m'
    fi
}

EXTSTS='\[$($DARK_BLACK_16_fg)\]\[$($DARK_BLACK_16_bg)\]$(exitstatus)'
TM1='\[$($DARK_YELLOW_16_fg)\][\t]\[$($NOCOLOR_16_fg)\]'
UWD1='\[$($DARK_BLUE_16_fg)\]\u\[$($NOCOLOR_16_fg)\]@\[$($DARK_PURPLE_16_fg)\]\W'
IDCTR1='\[$($DARK_GREEN_16_fg)\]~\[$($NOCOLOR_16_fg)\]'
GT1='\[$($DARK_RED_16_fg)\]$(__git_ps1 " (%s)")'
JBS1='\j '
TM2='\[$($DARK_YELLOW_16_fg)\]\[$($DARK_YELLOW_16_bg)$($DARK_BLACK_16_fg)\]\t\[$($NOCOLOR_16_bg)\]\[$($DARK_YELLOW_16_fg)\]\[$($NOCOLOR_16_fg)\]'
UWD2='\[$($DARK_BLUE_16_fg)\]\[$($DARK_BLUE_16_bg)$($DARK_BLACK_16_fg)\]\u\[$($DARK_PURPLE_16_fg)\]\[$($DARK_PURPLE_16_bg)$($DARK_BLACK_16_fg)\]\W\[$($NOCOLOR_16_bg)\]\[$($DARK_PURPLE_16_fg)\]\[$($NOCOLOR_16_fg)\]'
IDCTR2='\[$($DARK_GREEN_16_fg)\]\[$($DARK_GREEN_16_bg)$($DARK_BLACK_16_fg)\]~\[$($NOCOLOR_16_bg)$($DARK_GREEN_16_fg)\]\[$($NOCOLOR_16_fg)\]'
GT2='$(__git_ps1 " \[$($DARK_RED_16_fg)\]\[$($DARK_RED_16_bg)$($DARK_BLACK_16_fg)\]%s\[$($NOCOLOR_16_bg)\]\[$($DARK_RED_16_fg)\]\[$($NOCOLOR_16_fg)\]")'
TM3='\[$($DARK_YELLOW_16_fg)\]\[$($DARK_YELLOW_16_bg)$($DARK_BLACK_16_fg)\]\t\[$($DARK_YELLOW_16_bg)\]\[$($NOCOLOR_16_fg)\]'
UWD3='\[$($DARK_BLUE_16_fg)\]\[$($DARK_BLUE_16_bg)$($DARK_BLACK_16_fg)\]\u\[$($DARK_PURPLE_16_fg)\]\[$($DARK_PURPLE_16_bg)$($DARK_BLACK_16_fg)\]\W\[$($DARK_PURPLE_16_bg)\]\[$($NOCOLOR_16_fg)\]'
IDCTR3='\[$($NOCOLOR_16_bg)\]\[$($NOCOLOR_16_fg)\]'
GT3='$(__git_ps1 "\[$($DARK_RED_16_fg)\]\[$($DARK_RED_16_bg)$($DARK_BLACK_16_fg)\]%s\[$($DARK_RED_16_bg)\]\[$($NOCOLOR_16_fg)\]")'
TM4='\[$($DARK_YELLOW_16_fg)\]\[$($DARK_YELLOW_16_bg)$($DARK_BLACK_16_fg)\]\t\[$($DARK_YELLOW_16_bg)\]\[$($NOCOLOR_16_fg)\]'
UWD4='\[$($DARK_BLUE_16_fg)\]\[$($DARK_BLUE_16_bg)$($DARK_BLACK_16_fg)\]\u\[$($DARK_PURPLE_16_fg)\]\[$($DARK_PURPLE_16_bg)$($DARK_BLACK_16_fg)\]\W\[$($DARK_PURPLE_16_bg)$($DARK_PURPLE_16_fg)\]'
GT4='$(__git_ps1 "\[$($DARK_RED_16_fg)\]\[$($DARK_RED_16_bg)$($DARK_BLACK_16_fg)\]%s\[$($DARK_RED_16_bg)$($DARK_RED_16_fg)\]")'


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

