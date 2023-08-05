#!/usr/bin/env zsh

# Binds CTRL-F into the Projects fzf command
bindkey -s '^F' 'fzcd && clear\n'

# Binds the CTRL-E into the edit dotfiles command
bindkey -s '^E' 'editdot && clear\n'

# Binds CTRL-Y into the pkg install command
bindkey -s '^Y' 'pkginstall && clear\n'

# Binds CTRL-U into the pkg remove command
bindkey -s '^U' 'pkgremove && clear\n'

# Binds CTRL-P into the project creator
bindkey -s '^P' 'project_creator && clear\n'

# Binds CTRL-N into the edit notes function
bindkey -s '^N' 'editnotes && clear\n'

# Binds CTRL-H into the helper cheatsheet function
bindkey -s '^H' 'cheatsheet && clear\n'
