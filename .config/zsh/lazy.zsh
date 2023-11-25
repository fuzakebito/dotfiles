# env
export PNPM_HOME="$HOME/.local/share/pnpm"
export PATH=$HOME/asobi/bin:$HOME/go/bin:$PNPM_HOME:$HOME/.cargo/bin:$HOME/.local/bin:$PATH
export EDITOR=nvim
export SHELL=/bin/zsh
export BAT_THEME=base16
export MANPAGER='nvim +Man!'
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
mcd() {
  mkdir -p $1
  cd $1
}
zle-cd() {
  echo -e "\033[1A"
  local dir=$(z | cut -d ' ' -f2- | tr -d ' ' | fzf --height=11 --layout=reverse --tac --tiebreak=index --prompt="❯ " --preview='exa -a --group-directories-first --color always {}' --preview-window=down:3,border-top)
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
fzf-geometry() {
swaytree=$(swaymsg -t get_tree)
selected_id=$(echo "$swaytree" \
  | jq -r '
  [.. | select(.visible? == true)],
  [.. | select(.type? == "output" and .active? == true)],
  [.. | select(.type? == "root")]
  | .[] | [.id, .name] | @tsv' \
  | fzf --delimiter='\t' --with-nth=2 --height=~100% --layout=reverse | cut -f1)
if [[ -z "$selected_id" ]]; then
    return
fi
echo $(echo "$swaytree" | jq --arg id "$selected_id" '.. | select(.id? == ($id | tonumber)) | .rect | "\(.x),\(.y) \(.width)x\(.height)"' -r)
}
# hooks
chpwd() {
  if [[ $(pwd) != $HOME ]]; then;
    exa -a --group-directories-first
  fi
}
# others
eval "$(rtx activate zsh)"
autoload -Uz compinit; compinit
