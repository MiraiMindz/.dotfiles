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

prompt fullpl