# vim: fdm=marker
# env {{{
export PNPM_HOME="$HOME/.local/share/pnpm"
export PATH=$HOME/asobi/bin:$HOME/go/bin:$PNPM_HOME:$HOME/.bun/bin:$HOME/.cargo/bin:$HOME/.local/bin:$HOME/.local/share/gem/ruby/3.0.0/bin:$PATH
export EDITOR=nvim
export SHELL=/bin/zsh
export BAT_THEME=base16
export MANPAGER='nvim +Man!'
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
function recache_plugins(){sheldon source | tee $cache_dir/zsh/sheldon.zsh}
#function rezcompile(){rm -f $HOME/.zshrc.zwc ; zsh -i -c exit}
# }}}
# hooks {{{
chpwd() {
    if [[ $(pwd) != $HOME ]]; then;
        exa -a
    fi
}
# }}}
source $HOME/.zsh/fasd.zsh
eval "$(rtx activate zsh)"
