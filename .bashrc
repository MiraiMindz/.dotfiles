#
# ~/.bashrc
#

### If not running interactively, don't do anything
[[ $- != *i* ]] && return

PS1='[\u@\h \W]\$ '

### Variables
ARQUIVOS=/media/Arquivos/Arquivos
DOTFILES=$HOME/.dotfiles

### Functions
if [ -e $HOME/.bash_functions ]; then
    source $HOME/.bash_functions
fi

### Aliases
if [ -e $HOME/.bash_aliases ]; then
    source $HOME/.bash_aliases
fi
