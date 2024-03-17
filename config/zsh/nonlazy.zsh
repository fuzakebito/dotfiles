# options
HISTFILE=$HOME/.zsh_hist
HISTSIZE=1000000
SAVEHIST=1000000
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
# bindings
bindkey "^[[A" history-beginning-search-backward
bindkey "^[[B" history-beginning-search-forward
bindkey "^[[3~" delete-char
bindkey "^[[1~" beginning-of-line
bindkey "^[[H" beginning-of-line
bindkey "^[[4~" end-of-line
bindkey "^[[F" end-of-line
autoload -Uz edit-command-line
zle -N edit-command-line
bindkey '^xe' edit-command-line
