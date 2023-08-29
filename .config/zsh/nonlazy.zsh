# options
HISTFILE=$HOME/.zsh_hist
HISTSIZE=100000
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
# bindings
bindkey "^R" history-incremental-search-backward
bindkey "^S" history-incremental-search-forward
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

# setup Deno
export DENO_INSTALL="$HOME/.deno"
export PATH=$DENO_INSTALL/bin:$PATH

zmodload zsh/zpty
