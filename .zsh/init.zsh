# vim: fdm=marker
# options {{{
HISTFILE=$HOME/.zsh_hist
HISTSIZE=1000
SAVEHIST=100000
setopt EXTENDED_HISTORY
setopt hist_ignore_all_dups
setopt hist_reduce_blanks
setopt hist_no_store
setopt share_history
setopt autocd
setopt extendedglob
setopt noflowcontrol
setopt correct
unsetopt beep
# vi mode
bindkey -v
KEYTIMEOUT=2
# }}}
# env {{{
export PATH=$HOME/asobi/bin:$HOME/.local/bin:$PATH
export BAT_THEME=base16
# colorize
export LESS_TERMCAP_mb=$'\e[1;32m'
export LESS_TERMCAP_md=$'\e[1;32m'
export LESS_TERMCAP_me=$'\e[0m'
export LESS_TERMCAP_se=$'\e[0m'
export LESS_TERMCAP_so=$'\e[01;33m'
export LESS_TERMCAP_ue=$'\e[0m'
export LESS_TERMCAP_us=$'\e[1;4;31m'
# }}}
# alias {{{
alias exa='exa -F --group-directories-first --icons --git'
alias toilet='toilet -w $(tput cols)'
# }}}
# functions {{{
function Calendar(){curl -X POST -H 'Content-Type: application/json' -d '{"value1":"'$1'","value2":"'$2'","value3":"'$3'"}' https://maker.ifttt.com/trigger/AddCalendar/with/key/dZ0JXWCjtZ1F8p5iwtgB0D}
# }}}
# bindings {{{
bindkey "^R" history-incremental-search-backward
bindkey "^S" history-incremental-search-forward
bindkey "^[[A" history-beginning-search-backward
bindkey "^[[B" history-beginning-search-forward
bindkey "^[[3~" delete-char
bindkey "^[[1~" beginning-of-line
bindkey "^[[4~" end-of-line
# }}}
# hooks {{{
chpwd() {
    if [[ $(pwd) != $HOME ]]; then;
        exa -a
    fi
}
# }}}
