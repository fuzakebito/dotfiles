# env
export PNPM_HOME="$HOME/.local/share/pnpm"
export DENO_INSTALL="$HOME/.deno"
export PATH=$HOME/asobi/bin:$HOME/go/bin:$DENO_INSTALL/bin:$PNPM_HOME:$HOME/.cargo/bin:$HOME/.local/bin:$PATH
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
alias eza='eza -a --group-directories-first --icons --git'
alias toilet='toilet -w $(tput cols)'
alias fzf="fzf --prompt=' ' --pointer='❯' --marker='󰄬' --color='hl:6,hl+:14,bg+:-1,info:-1,prompt:6,pointer:6,marker:2,header:1'"
# functions
function mcd() {
  mkdir -p $1
  cd $1
}
function zle-cd() {
  echo -e "\033[1A"
  local dir=$(zoxide query -l | fzf --height=11 --layout=reverse --no-sort --scheme=path --info=hidden --color='border:8' --prompt="cd ❯ " --preview='eza -a --color=always --group-directories-first --icons --git {}' --preview-window=down:3,border-top)
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
function fzf-geometry() {
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
function cache_eval {
  mkdir -p $HOME/.cache/zsh
  local cache="$HOME/.cache/zsh/$(echo $1 | tr ' ' '_').zsh"
  if [[ ! -s "$cache" ]]; then
    eval $1 > $cache
  fi
  source "$cache"
}
function stderr_window() {
  local cmd="$@"
  local pipe_name="/tmp/tmux_tty_$$"

  [ -z "$cmd" ] && { echo "Usage: stderr_window \"command\"" >&2; return 1; }
  [ -z "$TMUX" ] && { echo "stderr_window can only be used within a tmux window." >&2; return 1; }

  if [ -z "$_stderr_window_tty" ]; then
    mkfifo "$pipe_name" || return 1
    tmux split-window -v -d "tty > '$pipe_name'; printf '\033]2;error_output\033\\'; cat"
    _stderr_window_tty=$(cat "$pipe_name")
    rm -f "$pipe_name"
  fi

  [ -z "$_stderr_window_tty" ] && return 1

  local cols=$(tmux list-panes -F '#{pane_width} #{pane_title}' | grep error_output | awk '{print $1}')

  if eval "$cmd" 2> >(tee "$_stderr_window_tty" >&2); then
    echo -n '\033[90m' >$_stderr_window_tty
    yes ─ | head -n $cols | tr -d '\n' >$_stderr_window_tty
    echo -n '\033[0m' >$_stderr_window_tty
  else
    local exit_code=$?
    echo "Command failed (exit code: $exit_code)." >"$_stderr_window_tty"
    echo -n '\033[90m' >$_stderr_window_tty
    yes ─ | head -n $cols | tr -d '\n' >$_stderr_window_tty
    echo -n '\033[0m' >$_stderr_window_tty
    return $exit_code
  fi
}
# hooks
chpwd() {
  if [[ $(pwd) != $HOME ]]; then;
    eza -a --group-directories-first --icons --git
  fi
}
# others
cache_eval "mise activate zsh"
zsh-defer cache_eval "zoxide init zsh --cmd d"
