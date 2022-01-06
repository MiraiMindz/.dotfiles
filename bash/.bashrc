#
# ~/.bashrc
#

### If not running interactively, don't do anything
[[ $- != *i* ]] && return

### Font Icons
if [[ -e $HOME/.local/share/icons-in-terminal/icons_bash.sh ]]; then
    source $HOME/.local/share/icons-in-terminal/icons_bash.sh
fi

### Text Formatting
if [ -e $HOME/.bash_text-formatting ]; then
    source $HOME/.bash_text-formatting
fi

### Variables
if [ -e $HOME/.bash_variables ]; then
    source $HOME/.bash_variables
fi

### Functions
if [ -e $HOME/.bash_functions ]; then
    source $HOME/.bash_functions
fi

### Aliases
if [ -e $HOME/.bash_aliases ]; then
    source $HOME/.bash_aliases
fi

### Git Completion
if [ -e $HOME/git-completion.bash ]; then
    source $HOME/git-completion.bash
fi

### Git Prompt
if [ -e $HOME/git-prompt.sh ]; then
    source $HOME/git-prompt.sh
    GIT_PS1_SHOWDIRTYSTATE=1
    GIT_PS1_SHOWSTASHSTATE=1
    GIT_PS1_SHOWUNTRACKEDFILES=1
    GIT_PS1_SHOWUNTRACKEDFILES=1
    GIT_PS1_SHOWCOLORHINTS=1
    GIT_PS1_SHOWUPSTREAM="auto"
    GIT_PS1_DESCRIBE_STYLE="branch"

    PS1='\[$($DARK_YELLOW_16_fg)\][\t]\[$($NOCOLOR_16_fg)\] \[$($DARK_BLUE_16_fg)\]\u\[$($NOCOLOR_16_fg)\]@\[$($DARK_PURPLE_16_fg)\]\W\[$($DARK_RED_16_fg)\]$(__git_ps1 " (%s)") \[$($DARK_GREEN_16_fg)\]~\[$($NOCOLOR_16_fg)\] '
else
    PS1='\[$($DARK_YELLOW_16_fg)\][\t]\[$($NOCOLOR_16_fg)\] \[$($DARK_BLUE_16_fg)\]\u\[$($NOCOLOR_16_fg)\]@\[$($DARK_PURPLE_16_fg)\]\W \[$($DARK_GREEN_16_fg)\]~\[$($NOCOLOR_16_fg)\] '
fi




# Prompt Customization
# PS1='\[$DARK_YELLOW\][\t]\[$NOCOLOR\] \[$DARK_BLUE\]\u\[$NOCOLOR\]@\[$DARK_PURPLE\]\W \[$DARK_GREEN\]~\[$NOCOLOR\] '
# PS1='\[$DARK_YELLOW\][\t]\[$NOCOLOR\] \[$DARK_BLUE\]\u\[$NOCOLOR\]@\[$DARK_PURPLE\]\W$(__git_ps1 " (%s)")\[$DARK_GREEN\] ~\[$NOCOLOR\] '
# PS1='[\t] \u@\W$(__git_ps1 " (%s)") ~ '
# PS1='\[$($DARK_YELLOW_16_fg)\][\t]\[$($NOCOLOR_16_fg)\] \[$($DARK_BLUE_16_fg)\]\u\[$($NOCOLOR_16_fg)\]@\[$($DARK_PURPLE_16_fg)\]\W\[$($DARK_RED_16_fg)\]$(__git_ps1 " (%s)") \[$($DARK_GREEN_16_fg)\]~\[$($NOCOLOR_16_fg)\] '
