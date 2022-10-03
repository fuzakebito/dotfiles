#!/usr/bin/env zsh
name=`cat /dev/urandom | tr -cd 'a-f0-9' | head -c 32`
nvim "/tmp/nvim$name"
wl-copy -n < "/tmp/nvim$name"
rm "/tmp/nvim$name"
