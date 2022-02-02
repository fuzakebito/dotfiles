bindkey ' '  zeno-auto-snippet

# fallback if snippet not matched (default: self-insert)
# export ZENO_AUTO_SNIPPET_FALLBACK=self-insert

# if you use zsh's incremental search
# bindkey -M isearch ' ' self-insert

bindkey '^m' zeno-auto-snippet-and-accept-line

bindkey '^i' zeno-completion

# fallback if completion not matched
# (default: fzf-completion if exists; otherwise expand-or-complete)
# export ZENO_COMPLETION_FALLBACK=expand-or-complete
bindkey '^r' zeno-history-selection
bindkey '^s' zeno-insert-snippet
bindkey '^g' zeno-ghq-cd
bindkey '^j' fazd
bindkey '^f' fazf
