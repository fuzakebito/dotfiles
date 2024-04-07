#!/bin/bash -u
FloatingVim=$(swaymsg -t get_tree | jq -c '.. | .floating_nodes? | arrays[] | select(.app_id=="FloatingVim")')

if [ -z $FloatingVim ]; then
  alacritty --class FloatingVim -o window.dimensions.columns=100 -o window.dimensions.lines=20 -o window.opacity=0.8 -e env ime=1 PATH=~/.deno/bin:$PATH nvim
else
  if [ "$(echo $FloatingVim | jq .focused)" = 'true' ]; then
    swaymsg "move window to scratchpad"
  else
    swaymsg "[app_id=\"FloatingVim\"] focus"
  fi
fi
