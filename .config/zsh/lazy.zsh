# env
export PNPM_HOME="$HOME/.local/share/pnpm"
export PATH=$HOME/asobi/bin:$HOME/go/bin:$PNPM_HOME:$HOME/.cargo/bin:$HOME/.local/bin:$PATH
export EDITOR=nvim
export SHELL=/bin/zsh
export BAT_THEME=base16
export MANPAGER='nvim +Man!'
export ZF_PROMPT=`echo "\033[36mzf ❯ \033[m"`
# colorize
export LESS_TERMCAP_mb=$'\e[1;32m'
export LESS_TERMCAP_md=$'\e[1;32m'
export LESS_TERMCAP_me=$'\e[0m'
export LESS_TERMCAP_se=$'\e[0m'
export LESS_TERMCAP_so=$'\e[01;33m'
export LESS_TERMCAP_ue=$'\e[0m'
export LESS_TERMCAP_us=$'\e[1;4;31m'
# alias
alias exa='exa -F --group-directories-first --icons --git'
alias toilet='toilet -w $(tput cols)'
# functions
zle-cd() {
  local dir=$(z | while IFS= read -r line; do echo ${line##* }; done | zf)
  if [ -z "$dir" ];then
    zle reset-prompt
    return 0
  fi
  BUFFER="cd $dir"
  zle reset-prompt
  zle accept-line
}
zle -N zle-cd
bindkey '^j' zle-cd
# hooks
chpwd() {
  if [[ $(pwd) != $HOME ]]; then;
    exa -a --group-directories-first
  fi
}
# others
eval "$(rtx activate zsh)"
autoload -Uz compinit; compinit
