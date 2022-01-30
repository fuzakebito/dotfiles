# vim: fdm=marker
# options {{{
HISTFILE=~/.zsh_hist
HISTSIZE=1000
SAVEHIST=100000
setopt EXTENDED_HISTORY
setopt hist_ignore_all_dups
setopt hist_reduce_blanks
setopt hist_no_store
setopt share_history
setopt autocd extendedglob
unsetopt beep
# vi mode
bindkey -v
KEYTIMEOUT=2
# }}}
# env {{{
export PATH=$PATH:/home/fuzakebito/asobi/bin
export BAT_THEME=base16
# }}}
# alias {{{
alias exa='exa -F --icons'
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
# }}}
# plugins {{{
# zeno {{{
# if defined load the configuration file from there
export ZENO_HOME=~/.zsh/zeno

# if disable deno cache command when plugin loaded
# export ZENO_DISABLE_EXECUTE_CACHE_COMMAND=1

# if enable fzf-tmux
export ZENO_ENABLE_FZF_TMUX=1

# if setting fzf-tmux options
export ZENO_FZF_TMUX_OPTIONS="-p"

# Experimental: Use UNIX Domain Socket
export ZENO_ENABLE_SOCK=1

# if disable builtin completion
export ZENO_DISABLE_BUILTIN_COMPLETION=1

export ZENO_GIT_CAT="bat --theme base16"
export ZENO_GIT_TREE="exa -TFla --icons --git --git-ignore -I .git"
# }}}
# }}}
