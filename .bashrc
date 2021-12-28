#
# ~/.bashrc
#

### If not running interactively, don't do anything
[[ $- != *i* ]] && return

### Colors
DARK_BLACK=$(tput setaf 0)
DARK_RED=$(tput setaf 1)
DARK_GREEN=$(tput setaf 2)
DARK_YELLOW=$(tput setaf 3)
DARK_BLUE=$(tput setaf 4)
DARK_PURPLE=$(tput setaf 5)
DARK_CYAN=$(tput setaf 6)
DARK_WHITE=$(tput setaf 7)
LIGHT_BLACK=$(tput setaf 8)
LIGHT_RED=$(tput setaf 9)
LIGHT_GREEN=$(tput setaf 10)
LIGHT_YELLOW=$(tput setaf 11)
LIGHT_BLUE=$(tput setaf 12)
LIGHT_PURPLE=$(tput setaf 13)
LIGHT_CYAN=$(tput setaf 14)
LIGHT_WHITE=$(tput setaf 15)
NOCOLOR=$(tput sgr0)

PS1='\[$DARK_YELLOW\][\t]\[$NOCOLOR\] \[$DARK_BLUE\]\u\[$NOCOLOR\]@\[$DARK_PURPLE\]\W \[$DARK_GREEN\]~\[$NOCOLOR\] '

### Variables
ARQUIVOS=/media/Arquivos/Arquivos
DOTFILES=$HOME/.dotfiles

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
