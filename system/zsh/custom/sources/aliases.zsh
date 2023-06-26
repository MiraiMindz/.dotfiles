#!/usr/bin/env zsh

alias nv="nvim"
alias editdot='sh -c "curdir=\$(pwd); cd $DOTFILES && nvim; cd \$curdir"'
alias fzcd='cd "$(while IFS="" read -r line; do echo "${line#*:}"; done < "${HOME}/.warprc" | fzf)"'
