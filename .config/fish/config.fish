fish_vi_key_bindings
# fzf
set -U FZF_LEGACY_KEYBINDINGS 0
set -U FZF_COMPLETE 3
set -U FZF_ENABLE_OPEN_PREVIEW 1
set -U FZF_FIND_FILE_COMMAND "fd --type f . \$dir"

set -x BAT_THEME base16
alias inst "yay -S"
alias unst "yay -Rns"
abbr su "su -p"
abbr sudo "sudo -E"
abbr uqwatch "watch -n 60 -d uqzaiko"
abbr ls "lsd"
abbr r "ranger"
abbr f " fuck"
