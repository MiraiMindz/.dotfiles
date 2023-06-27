#!/usr/bin/env zsh


if [[ -e $(command -v doas) ]]; then
  alias sudo='doas'
  alias dias='doas'
  alias root='doas -u root su'
  alias su='doas -u root su'
  
  if [[ -e $(command -v nvim) ]];then
    alias sudoedit='doas nvim'
  else
    alias sudoedit='doas nano'
  fi
else
  alias root='sudo -i'
  alias su='sudo -i'
fi

alias nv="nvim"
alias count='find . -type f | wc -l'
alias ping='ping -c 5'
alias untar='tar -zxvf'

alias rm='rm_funct'
alias rmdir='shreddir'
alias mv='mv -i'
alias cp='cp -i'
alias ln='ln -i'
alias chown='chown --preserve-root'
alias chmod='chmod --preserve-root'
alias chgrp='chgrp --preserve-root'

alias mount="mount_func"
alias mnt="mount_func"


# Error correction
# Vim aliases 
alias :q="exit"
alias :wq="exit"
alias :w="exit"

# Typos
alias cler="clear"
alias claer="clear"
alias clar="clear"
alias cleer="clear"
alias claar="clear"
alias clera="clear"
alias cçear="clear"
alias cls="clear"
alias clr="clear"

alias dc="cd"
alias cdc="cd"
alias dcd="cd"
alias cdd="cd"
alias dcc="cd"
alias ccd="cd"
alias ddc="cd"
alias cd.='cd ../'
alias cd..='cd ../../'
alias cd...='cd ../../../'
alias cd....='cd ../../../../'
alias cd.....='cd ../../../../../'
alias dc.="cd."
alias dc..="cd.."
alias dc...="cd..."
alias dc....="cd...."
alias dc.....="cd....."

alias exi="exit"
alias ext="exit"
alias exot="exit"

alias sl="ls"
alias ssl="ls"
alias lls="ls"

