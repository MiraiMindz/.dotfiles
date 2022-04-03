### Prompts
autoload -Uz promptinit && promptinit
setopt prompt_subst

### Colors
autoload -U colors && colors

if [ -e $HOME/.zsh/git-prompt.sh ]; then
    GIT_PS1_SHOWDIRTYSTATE=1
    GIT_PS1_SHOWSTASHSTATE=1
    GIT_PS1_SHOWUNTRACKEDFILES=1
    GIT_PS1_SHOWUPSTREAM="auto"
    GIT_PS1_DESCRIBE_STYLE="branch"
fi

exitstatus() {
    if [[ $? == 0 ]]; then
        echo "%F{2}⬤ %f";
    else
        echo "%F{1}⬤ %f";
    fi
}


prompt_basenopl_setup() {
    TM='%F{3}[%*]%f'
    UWD='%F{4}%n%f@%F{5}%1~%f'
    GT=$'%F{1}$(__git_ps1 " %s")%f'
    IDCTR='%F{2}~%f'
    PS1="${TM} ${UWD}${GT} ${IDCTR} "
    PS2="└${GT} ${IDCTR} "
}

prompt_fullpl_setup() {
    TM='%F{3}%f%K{3}%F{0}%*%f'
    UWD='%F{4}%k%f%K{4}%F{0}%n%f%F{5}%f%k%F{0}%K{5}%1~%f%F{5}'
    GT=$'$(__git_ps1 " %%F{1}%%f%%K{1}%%F{0}%s%%F{1}")'
    SUB='%F{0}%K{0} '
    IDCTR='%k%f'
    PS1="${TM}${UWD}${GT}${IDCTR} "
    PS2="${SUB}${GT}${IDCTR} "
    RPS1="%F{0}%f%K{0}%F{7}$(exitstatus)%j%k%f%F{0}%f"
    # RPS2=''
}

prompt_themes+=(basenopl fullpl)
