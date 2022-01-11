#
# ~/.bashrc
#

### If not running interactively, don't do anything
[[ $- != *i* ]] && return

### Font Icons
if [[ -e $HOME/.local/share/icons-in-terminal/icons_bash.sh ]]; then
    source $HOME/.local/share/icons-in-terminal/icons_bash.sh
fi

if [[ -d $HOME/.bash ]]; then
    ### Text Formatting
    if [ -e $HOME/.bash/.bash_text-formatting ]; then
        source $HOME/.bash/.bash_text-formatting
    fi

    ### Variables
    if [ -e $HOME/.bash/.bash_variables ]; then
        source $HOME/.bash/.bash_variables
    fi

    ### Functions
    if [ -e $HOME/.bash/.bash_functions ]; then
        source $HOME/.bash/.bash_functions
    fi

    ### Aliases
    if [ -e $HOME/.bash/.bash_aliases ]; then
        source $HOME/.bash/.bash_aliases
    fi

    ### Git Completion
    if [ -e $HOME/.bash/git-completion.bash ]; then
        source $HOME/.bash/git-completion.bash
    fi

    ### Git Prompt
    if [ -e $HOME/.bash/git-prompt.sh ]; then
        source $HOME/.bash/git-prompt.sh
        GIT_PS1_SHOWDIRTYSTATE=1
        GIT_PS1_SHOWSTASHSTATE=1
        GIT_PS1_SHOWUNTRACKEDFILES=1
        GIT_PS1_SHOWUNTRACKEDFILES=1
        GIT_PS1_SHOWCOLORHINTS=1
        GIT_PS1_SHOWUPSTREAM="auto"
        GIT_PS1_DESCRIBE_STYLE="branch"
    fi

    ### Bash Prompts
    if [[ -e $HOME/.bash/.bash_prompts ]]; then
        source $HOME/.bash/.bash_prompts
    fi

    # ## Greeter
    # if [[ -e $HOME/.bash/.bash_greeter ]]; then
    #     # trap 'greeter' SIGWINCH
    #     sh $HOME/.bash/.bash_greeter
    # fi
else
    ### Text Formatting
    if [ -e $HOME/.bash_text-formatting ]; then
        source $HOME/.bash_text-formatting
    fi

    ### Variables
    if [ -e $HOME/.bash_variables ]; then
        source $HOME/.bash_variables
    fi

    ### Functions
    if [ -e $HOME/.bash_functions ]; then
        source $HOME/.bash_functions
    fi

    ### Aliases
    if [ -e $HOME/.bash_aliases ]; then
        source $HOME/.bash_aliases
    fi

    ### Git Completion
    if [ -e $HOME/git-completion.bash ]; then
        source $HOME/git-completion.bash
    fi

    ### Git Prompt
    if [ -e $HOME/git-prompt.sh ]; then
        source $HOME/git-prompt.sh
        GIT_PS1_SHOWDIRTYSTATE=1
        GIT_PS1_SHOWSTASHSTATE=1
        GIT_PS1_SHOWUNTRACKEDFILES=1
        GIT_PS1_SHOWUNTRACKEDFILES=1
        GIT_PS1_SHOWCOLORHINTS=1
        GIT_PS1_SHOWUPSTREAM="auto"
        GIT_PS1_DESCRIBE_STYLE="branch"
    fi

    ### Bash Prompts
    if [[ -e $HOME/.bash_prompts ]]; then
        source $HOME/.bash_prompts
    fi

    # ## Greeter
    # if [[ -e $HOME/.bash_greeter ]]; then
    #     # trap 'greeter' SIGWINCH
    #     sh $HOME/.bash_greeter
    # fi
fi
