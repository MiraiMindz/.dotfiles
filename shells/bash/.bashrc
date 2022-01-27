#
# ~/.bashrc
#

### If not running interactively, don't do anything
[[ $- != *i* ]] && return

### Font Icons
if [[ -e $HOME/.local/share/icons-in-terminal/icons_bash.sh ]]; then
    source $HOME/.local/share/icons-in-terminal/icons_bash.sh
fi

### Configs
if [[ -d $HOME/.bash ]]; then
    for itn in $HOME/.bash/*; do
        source $itn
    done
fi

for itn in $HOME/.bash/*; do source $itn; done
