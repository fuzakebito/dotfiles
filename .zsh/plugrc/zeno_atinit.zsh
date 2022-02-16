export ZENO_HOME=$HOME/.zsh/zeno

# enable fzf-tmux
export ZENO_ENABLE_FZF_TMUX=1

# setting fzf-tmux options
export ZENO_FZF_TMUX_OPTIONS="-p 70% --ansi"

# Experimental: Use UNIX Domain Socket
export ZENO_ENABLE_SOCK=1

export ZENO_GIT_CAT="bat --theme base16"
export ZENO_GIT_TREE="exa -TFla --icons --git --git-ignore -I .git"

# zeno local widgets {{{
# vim: fdm=marker
() {
  local widget_dirs=(
    "${ZENO_HOME}/widget"
  )
  local f

  fpath+=("${(@)widget_dirs}")
  for f in "${(@)^widget_dirs}"/*(N-.);do autoload -Uz -- "${f:t}"; zle -N -- "${f:t}"; done
}
# }}}
