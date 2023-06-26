#!/usr/bin/env zsh

# Binds CTRL-F into the Projects fzf command
bindkey -s '^F' 'fzcd\n'

# Binds the CTRL-E into the edit dotfiles command
bindkey -s '^E' 'editdot\n'

# Binds CTRL-Y into the pkg install command
bindkey -s '^Y' 'pkginstall\n'

# Binds CTRL-U into the pkg remove command
bindkey -s '^U' 'pkgremove\n'

# Binds CTRL-B into the ranger command
bindkey -s '^B' 'ranger\n'

