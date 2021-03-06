#!/bin/bash
killall -q picom
picom --config $HOME/.config/picom/picom.conf --experimental-backends
