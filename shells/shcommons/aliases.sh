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

if [[ -e $(which ccat) ]]; then
    alias cat=ccat
fi

if [[ -e $(which nvim) ]];then
    alias vim=nvim
    alias vi=nvim
fi

alias cler=clear
alias claer=clear
alias clar=clear
alias cleer=clear
alias claar=clear
alias clera=clear
alias cçear=clear
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
alias rmd='shreddir'
alias rms='shred -n 30 -v -u'
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
alias neofetch=twitchfetch
alias timeshell='for i in $(seq 1 10); do time $SHELL -i -c exit; done'
alias gitignsymlink='find . -type l >> .gitignore'
alias initgitcli='git init -b main && git add . && git commit -m "initial commit" && gh repo create'
alias trmcolors='printf " \e[30m⬤ \e[31m⬤ \e[32m⬤ \e[33m⬤ \e[34m⬤ \e[35m⬤ \e[36m⬤ \e[37m⬤ \e[39m\n \e[90m⬤ \e[91m⬤ \e[92m⬤ \e[93m⬤ \e[94m⬤ \e[95m⬤ \e[96m⬤ \e[97m⬤ \e[39m\nCOLORTERM=$COLORTERM\n"'
