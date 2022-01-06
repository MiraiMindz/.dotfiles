#
# ~/.bashrc
#

### If not running interactively, don't do anything
[[ $- != *i* ]] && return

### Text Formatting
if [ -e $HOME/.bash_text-formatting ]; then
    source $HOME/.bash_text-formatting
fi


### Variables
ARQUIVOS=/media/Arquivos/Arquivos
DOTFILES=$HOME/.dotfiles
CURSOSPROGRAMACAO=/media/Arquivos/Arquivos/Programacao/Courses
VSCODEPROJECTS=/media/Arquivos/Arquivos/Programacao/VisualCode/Projects
VSCODECOURSES=/media/Arquivos/Arquivos/Programacao/VisualCode/Courses
VSCODELIBRARIES=/media/Arquivos/Arquivos/Programacao/VisualCode/Libraries

### Export Variables
export GOROOT=/usr/lib/go
export GOPATH=$HOME/go

### Functions
if [ -e $HOME/.bash_functions ]; then
    source $HOME/.bash_functions
fi

### Aliases
if [ -e $HOME/.bash_aliases ]; then
    source $HOME/.bash_aliases
fi

# Git Completion
if [ -e $HOME/git-completion.bash ]; then
    source $HOME/git-completion.bash
fi

# Git Prompt
if [ -e $HOME/git-prompt.sh ]; then
    source $HOME/git-prompt.sh
fi

GIT_PS1_SHOWDIRTYSTATE=1
GIT_PS1_SHOWSTASHSTATE=1
GIT_PS1_SHOWUNTRACKEDFILES=1
GIT_PS1_SHOWUNTRACKEDFILES=1
GIT_PS1_SHOWCOLORHINTS=1
GIT_PS1_SHOWUPSTREAM="auto"
GIT_PS1_DESCRIBE_STYLE="branch"


# Prompt Customization
# PS1='\[$DARK_YELLOW\][\t]\[$NOCOLOR\] \[$DARK_BLUE\]\u\[$NOCOLOR\]@\[$DARK_PURPLE\]\W \[$DARK_GREEN\]~\[$NOCOLOR\] '
# PS1='\[$DARK_YELLOW\][\t]\[$NOCOLOR\] \[$DARK_BLUE\]\u\[$NOCOLOR\]@\[$DARK_PURPLE\]\W$(__git_ps1 " (%s)")\[$DARK_GREEN\] ~\[$NOCOLOR\] '
# PS1='[\t] \u@\W$(__git_ps1 " (%s)") ~ '
PS1='\[$($DARK_YELLOW_16_fg)\][\t]\[$($NOCOLOR_16_fg)\] \[$($DARK_BLUE_16_fg)\]\u\[$($NOCOLOR_16_fg)\]@\[$($DARK_PURPLE_16_fg)\]\W\[$($DARK_RED_16_fg)\]$(__git_ps1 " (%s)") \[$($DARK_GREEN_16_fg)\]~\[$($NOCOLOR_16_fg)\] '
