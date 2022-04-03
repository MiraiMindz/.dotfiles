### Font Icons
if [[ -e $HOME/.local/share/icons-in-terminal/icons_bash.sh ]]; then
    source $HOME/.local/share/icons-in-terminal/icons_bash.sh
fi

### Configs
if [[ -d $HOME/.zsh ]]; then
    for itn in $HOME/.zsh/*; do
        source $itn
    done
fi

### Hitory file
HISTFILE=${ZDOTDIR:-$HOME}/.zsh_history
SAVEHIST=1000

### Prompt
prompt fullpl

### PKGFILE Completions
source /usr/share/doc/pkgfile/command-not-found.zsh
