stty stop undef

PS1="\[\e[30;107m\] \W\[\e[97;44m\]\[\e[30m\]\$\[\e[34;49m\]\[\e[0m\]"

alias ls='ls -AF --color=auto'
alias inst='yay -S $@'
alias unst='yay -Rns $@'
alias atrm='sudo pacman -Qdtq | sudo pacman -Rs' 


function share_history {
    history -a
    history -c
    history -r
}

export HISTCONTROL=ignoreboth:erasedups

PROMPT_COMMAND='share_history'
shopt -u histappend
export HISTSIZE=9999
