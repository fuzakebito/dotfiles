HISTFILE=~/.zsh_hist
HISTSIZE=1000
SAVEHIST=100000
setopt EXTENDED_HISTORY
setopt hist_ignore_all_dups
setopt hist_reduce_blanks
setopt hist_no_store
setopt share_history
bindkey "^R" history-incremental-search-backward
bindkey "^S" history-incremental-search-forward
bindkey "^[[A" history-beginning-search-backward
bindkey "^[[B" history-beginning-search-forward
setopt autocd extendedglob
unsetopt beep
bindkey -v

export PATH=$PATH:/home/fuzakebito/asobi/bin

alias ls='lsd'
alias inst='yay -S'
alias unst='yay -Rns'
alias atrm='sudo pacman -Qdtq | sudo pacman -Rs'
alias vim='nvim'
alias toilet='toilet -w $(tput cols)'
alias :q='exit'
function Calendar(){curl -X POST -H 'Content-Type: application/json' -d '{"value1":"'$1'","value2":"'$2'","value3":"'$3'"}' https://maker.ifttt.com/trigger/AddCalendar/with/key/dZ0JXWCjtZ1F8p5iwtgB0D}

eval "$(starship init zsh)"

### Added by Zinit's installer
if [[ ! -f $HOME/.local/share/zinit/zinit.git/zinit.zsh ]]; then
    print -P "%F{33} %F{220}Installing %F{33}ZDHARMA-CONTINUUM%F{220} Initiative Plugin Manager (%F{33}zdharma-continuum/zinit%F{220})…%f"
    command mkdir -p "$HOME/.local/share/zinit" && command chmod g-rwX "$HOME/.local/share/zinit"
    command git clone https://github.com/zdharma-continuum/zinit "$HOME/.local/share/zinit/zinit.git" && \
        print -P "%F{33} %F{34}Installation successful.%f%b" || \
        print -P "%F{160} The clone has failed.%f%b"
fi

source "$HOME/.local/share/zinit/zinit.git/zinit.zsh"
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit

# Load a few important annexes, without Turbo
# (this is currently required for annexes)
zinit light-mode for \
    zdharma-continuum/zinit-annex-as-monitor \
    zdharma-continuum/zinit-annex-bin-gem-node \
    zdharma-continuum/zinit-annex-patch-dl \
    zdharma-continuum/zinit-annex-rust \
    zsh-users/zsh-syntax-highlighting

### End of Zinit's installer chunk
