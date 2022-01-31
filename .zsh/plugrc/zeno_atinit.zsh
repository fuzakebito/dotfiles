# if defined load the configuration file from there
export ZENO_HOME=~/.zsh/zeno

# if disable deno cache command when plugin loaded
# export ZENO_DISABLE_EXECUTE_CACHE_COMMAND=1

# if enable fzf-tmux
export ZENO_ENABLE_FZF_TMUX=1

# if setting fzf-tmux options
export ZENO_FZF_TMUX_OPTIONS="-p 70%"

# Experimental: Use UNIX Domain Socket
export ZENO_ENABLE_SOCK=1

# if disable builtin completion
# export ZENO_DISABLE_BUILTIN_COMPLETION=1

export ZENO_GIT_CAT="bat --theme base16"
export ZENO_GIT_TREE="exa -TFla --icons --git --git-ignore -I .git"
