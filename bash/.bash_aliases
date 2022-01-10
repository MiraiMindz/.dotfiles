if [[ -e $(which doas) ]]; then
    alias sudo='doas'
    alias dias='doas'
    if [[ -e $(which vim) ]];then
        alias sudoedit='doas vim'
    else
        alias sudoedit='doas rnano'
    fi
fi

if [[ -e $(which lsd) ]];then
    alias ls='lsd'
    if [[ -e $(which tree) ]]; then
        alias lt='ls --tree'
        alias ltt='tree --dirsfirst -u -D -h -C -p -F -L 5'
        alias lttf='tree --dirsfirst -u -D -h -C -p -F -f -L 5'
        alias lttsf='tree --dirsfirst -u -D -h -C -p -F -l -L 5'
        alias lttd='tree --dirsfirst -u -D -h -C -p -F -d -L 5'
        alias ltta='tree --dirsfirst -u -D -h -C -p -F -a -L 5'
        alias lttl='tree --dirsfirst -u -D -h -C -p -F -L'
        alias lttlall='tree --dirsfirst -u -D -h -C -p -F -f -l -a -L'
        alias lttall='tree --dirsfirst -u -D -h -C -p -F -f -l -a -L 5'
    else
        alias lt='ls --tree'
    fi
else
    alias ls='ls -F --color=auto'
    if [[ -e $(which tree) ]]; then
        alias lt='tree --dirsfirst -u -D -h -C -p -F -L 5'
        alias ltf='tree --dirsfirst -u -D -h -C -p -F -f -L 5'
        alias ltsf='tree --dirsfirst -u -D -h -C -p -F -l -L 5'
        alias ltd='tree --dirsfirst -u -D -h -C -p -F -d -L 5'
        alias lta='tree --dirsfirst -u -D -h -C -p -F -a -L 5'
        alias ltl='tree --dirsfirst -u -D -h -C -p -F -L'
        alias ltlall='tree --dirsfirst -u -D -h -C -p -F -f -l -a -L'
        alias ltall='tree --dirsfirst -u -D -h -C -p -F -f -l -a -L 5'
    else
        alias lt='ls --human-readable --size -1 -S --classify'
    fi
fi

if [[ -e $(which icons-in-terminal) ]];then
    alias termicon=icons-in-terminal
fi

alias cler=clear
alias claer=clear
alias clar=clear
alias cleer=clear
alias claar=clear
alias clera=clear
alias cçear=clear
alias rm='shred -u'
alias dc=cd
alias cdc=cd
alias dcd=cd
alias cdd=cd
alias dcc=cd
alias ccd=cd
alias ddc=cd
alias cd.='cd ../'
alias cd..='cd ../../'
alias cd...='cd ../../../'
alias cd....='cd ../../../../'
alias cd.....='cd ../../../../../'
alias dc.=cd.
alias dc..=cd..
alias dc...=cd...
alias dc....=cd....
alias dc.....=cd.....
alias exi=exit
alias ext=exit
alias sl=ls
alias ssl=ls
alias lls=ls
alias ld='ls -d'
alias ll='ls -lh'
alias la='ls -a'
alias lla='ls -a -lh'
alias modfiles='ls -t -1'
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
