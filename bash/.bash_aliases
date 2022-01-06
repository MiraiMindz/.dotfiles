alias cler=clear
alias claer=clear
alias clar=clear
alias cleer=clear
alias claar=clear
alias dc=cd
alias cdc=cd
alias dcd=cd
alias cdd=cd
alias dcc=cd
alias ccd=cd
alias ddc=cd
alias exi=exit
alias ext=exit
alias count='find . -type f | wc -l'
alias ping='ping -c 5'
alias untar='tar -zxvf '
alias cpv='rsync -ah --info=progress2'
alias shredrm='shred -n 30 -v -u'
alias rm='rm -I --preserve-root'
alias mv='mv -i'
alias cp='cp -i'
alias ln='ln -i'
alias chown='chown --preserve-root'
alias chmod='chmod --preserve-root'
alias chgrp='chgrp --preserve-root'
alias root='sudo -i'
alias su='sudo -i'
alias meminfo='free -m -l -t'
alias psmem='ps auxf | sort -nr -k 4'
alias psmem10='ps auxf | sort -nr -k 4 | head -10'
alias pscpu='ps auxf | sort -nr -k 3'
alias pscpu10='ps auxf | sort -nr -k 3 | head -10'
alias cpuinfo='lscpu'
alias gpumeminfo='grep -i --color memory /var/log/Xorg.0.log'
alias mnt="mount | awk -F' ' '{ printf \"%s\t%s\n\",\$1,\$3; }' | column -t | egrep ^/dev/ | sort"
alias grphis='history|grep'
alias topgit='cd `git rev-parse --show-toplevel` && git checkout master && git pull'
alias cg='cd `git rev-parse --show-toplevel`'
alias initgitcli='git init -b main && git add . && git commit -m "initial commit" && gh repo create'
alias trmcolors='printf "\033[0;30m██\033[0;31m██\033[0;32m██\033[0;33m██\033[0;34m██\033[0;35m██\033[0;36m██\033[0;37m\033[0m\n\033[1;30m██\033[1;31m██\033[1;32m██\033[1;33m██\033[1;34m██\033[1;35m██\033[1;36m██\033[1;37m\033[0m\n" && printf "COLORTERM=$COLORTERM\n"'


if [[ -e $(which lsd) ]];then
    alias ls='lsd'
    if [[ -e $(which tree) ]]; then
        alias lt='ls --tree'
        alias ltt='tree --dirsfirst -u -D -h -C -p -F'
        alias lttf='lt -f'
        alias lttsf='lt -l'
        alias lttd='lt -d'
        alias ltta='lt -a'
        alias lttl='lt -L'
        alias lttall='lt -f -l -a -L'
    else
        alias lt='ls --tree'
    fi
else
    alias ls='ls -F --color=auto'
    if [[ -e $(which tree) ]]; then
        alias lt='tree --dirsfirst -u -D -h -C -p -F'
        alias ltf='lt -f'
        alias ltsf='lt -l'
        alias ltd='lt -d'
        alias lta='lt -a'
        alias ltl='lt -L'
        alias ltall='lt -f -l -a -L'
    else
        alias lt='ls --human-readable --size -1 -S --classify'
    fi
fi

alias sl=ls
alias ssl=ls
alias lls=ls
alias ld='ls -d'
alias ll='ls -lh'
alias la='ls -a'
alias lla='ls -a -lh'
alias modfiles='ls -t -1'

