#!/bin/bash -u
FloatingVim=$(swaymsg -t get_tree | jq -c '.. | .floating_nodes? | arrays[] | select(.app_id=="FloatingVim")')

if [ -z $FloatingVim ]; then
  footclient -a FloatingVim -W 100x20 -o colors.alpha=0.8 -o pad=1x1 -e zsh -i -c "env ime=1 nvim -c 'set clipboard=unnamedplus'"
else
  if [ "$(echo $FloatingVim | jq .focused)" = 'true' ]; then
    swaymsg "move window to scratchpad"
  else
    swaymsg "[app_id=\"FloatingVim\"] focus"
  fi
fi
