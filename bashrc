# .bashrc

# source bb specifics
if [ -f ~/.bbbashrc ]; then
    . ~/.bbbashrc
fi

# Source global definitions
if [ -f /etc/bashrc ]; then
    . /etc/bashrc
fi

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

# User specific aliases and functions

alias lrt="ls -lrt"
alias ll="ls -l"

##-ANSI-COLOR-CODES-##
Color_Off="\[\033[0m\]"
###-Regular-###
Red="\[\033[0;31m\]"
Green="\[\033[0;32m\]"
Purple="\[\033[0;35\]"
####-Bold-####
BRed="\[\033[1;31m\]"
BPurple="\[\033[1;35m\]"
Cyan="\[\033[0;36m\]"

# Modify prompt to display error codes of previous command
PROMPT_COMMAND=__prompt_command # Func to gen PS1 after CMDs

__prompt_command() {
    local EXIT="$?"             # This needs to be first
    PS1=""
    local RCol='\[\e[0m\]'
    if [ $EXIT != 0 ]; then
        PS1+="${Red}$EXIT${Color_Off} "
    else
        PS1="" #PS1+="${Green}$EXIT${Color_Off}"
    fi
    PS1+="\A $Cyan\u${Color_Off}@$Cyan\h${Color_Off}\$ "
}

# os specifics

os=$(uname)

if [ $os = "Darwin" ]; then
    alias ls="ls -G"
fi
