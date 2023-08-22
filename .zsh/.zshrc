# vim: foldmethod=marker
if [[ ! -r $HOME/.zshrc.zwc  ]]; then
  function source {
    builtin source $1
    zcompile $1
  }
  zcompile ~/.zshrc
fi

export cache_dir=${XDG_CACHE_HOME:-$HOME/.cache}
source $HOME/.zsh/nonlazy.zsh
# load cached sheldon
if [[ -r "$cache_dir/zsh/sheldon.zsh" ]]; then
  source "$cache_dir/zsh/sheldon.zsh"
else
  mkdir -p $cache_dir/zsh
  eval "$(sheldon source | tee $cache_dir/zsh/sheldon.zsh)"
fi
# setup Deno
export DENO_INSTALL="$HOME/.deno"
# set PATH
export PATH=$DENO_INSTALL/bin:$PATH
# Load p10k prompt
ZLE_RPROMPT_INDENT=0
source $HOME/.zsh/p10k.zsh
# load lazy zshrc
zsh-defer source $HOME/.zsh/lazy.zsh
