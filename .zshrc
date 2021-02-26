# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=10000
setopt hist_ignore_all_dups
setopt hist_reduce_blanks
setopt hist_no_store
setopt share_history
bindkey "^R" history-incremental-search-backward
bindkey "^S" history-incremental-search-forward
bindkey "^[[A" history-beginning-search-backward
bindkey "^[[B" history-beginning-search-forward
setopt autocd extendedglob
unsetopt beep
bindkey -v

export PATH=$PATH:/home/fuzakebito/asobi/bin

alias ls='ls -AF --color=auto'
alias inst='yay -S'
alias unst='yay -Rns'
alias atrm='sudo pacman -Qdtq | sudo pacman -Rs'
alias vim='nvim'
alias toilet='toilet -w $(tput cols)'
alias :q='exit'
alias tmxrst='tmux kill-server'
function attex(){platex "$1"tex && dvipdfmx -V 4 "$1"dvi && evince "$1"pdf}
function Calendar(){curl -X POST -H 'Content-Type: application/json' -d '{"value1":"'$1'","value2":"'$2'","value3":"'$3'"}' https://maker.ifttt.com/trigger/AddCalendar/with/key/dZ0JXWCjtZ1F8p5iwtgB0D}

# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/fuzakebito/.zshrc'

autoload -Uz compinit
autoload -Uz colors && colors
autoload -Uz add-zsh-hook
autoload -Uz terminfo
compinit
terminfo_down_sc=$terminfo[cud1]$terminfo[cuu1]$terminfo[sc]$terminfo[cud1]
left_down_prompt_preexec() {
    print -rn -- $terminfo[el]
}
add-zsh-hook preexec left_down_prompt_preexec
# End of lines added by compinstall
# PROMPT="%{[30;107m%} %~%{[97;44m%}%{[30m%}%#%{[34;49m%}%{[0m%} $KEYMAP"
function zle-keymap-select zle-line-init zle-line-finish
{
    case $KEYMAP in
        main|viins)
            PROMPT_2="$fg[cyan]-- INSERT --$reset_color"
            ;;
        vicmd)
            PROMPT_2="$fg[white]-- NORMAL --$reset_color"
            ;;
        visual)
            PROMPT_2="$fg[green]-- VISUAL --$reset_color"
            ;;
    esac

    PROMPT="%{$terminfo_down_sc$PROMPT_2$terminfo[rc]%}%{[30;107m%} %~%{[97;46m%}%{[30m%}%#%{[36;49m%}%{[0m%}"
    zle reset-prompt
}
zle -N zle-line-init
zle -N zle-line-finish
zle -N zle-keymap-select
zle -N edit-command-line

eval $(thefuck --alias)
