# .bashrc

# source bb specifics
if [ -f ~/.bbbashrc ]; then
    . ~/.bbbashrc
fi

# Source global definitions
if [ -f /etc/bashrc ]; then
    . /etc/bashrc
fi

# User specific aliases and functions

# os specifics
os=$(uname)

if [ "$os" = "Darwin" ]; then
    alias ls="ls -G"
elif [ "$os" = "Linux" ]; then
    alias ls='ls --color=auto'
    #load directory colors
    #solarized installed from https://github.com/seebi/dircolors-solarized
    # note that fedora loads ~/.dir_colors already
    # if [ -f ~/.dir_colors ]; then
    #     eval $(dircolors ~/.dir_colors)
    # fi
fi

alias grep='grep --color=auto'
alias lrt="ls -lrt"
alias ll="ls -l"
alias v="vim -u NONE -c 'filetype plugin on' -c 'set nu'" # vim without loading vimrc
alias lvim="LIGHTVIM='y' vim"

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
