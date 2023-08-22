# vim: fdm=marker
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
eval "$(bindkey -e && bindkey -L)"
if [[ -r "$cache_dir/zsh/emacs-bind.zsh" ]]; then
  source "$cache_dir/zsh/emacs-bind.zsh"
else
  mkdir -p $cache_dir/zsh
  eval "$(bindkey -e && bindkey -L | tee $cache_dir/zsh/emacs-bind.zsh)"
fi
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

zmodload zsh/zpty
