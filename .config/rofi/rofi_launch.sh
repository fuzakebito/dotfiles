#!/bin/bash

export LANG=en_US.UTF-8
rofi -modi "ssh,combi,run" -modi combi -show combi -combi-modi window,drun,run -disable-history -theme ~/.config/rofi/sidetab -font "Jost* Light 15"
