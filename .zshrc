# vim: foldmethod=marker
# p10k instant prompt {{{
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi
# }}}

source $HOME/.zsh/init.zsh

eval "$(sheldon source)"

zsh-defer source $HOME/.zsh/fasd.zsh

# Load p10k prompt
ZLE_RPROMPT_INDENT=0
source $HOME/.zsh/p10k.zsh
