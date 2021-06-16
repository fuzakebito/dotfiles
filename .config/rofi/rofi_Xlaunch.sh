#!/bin/bash

export GDK_BACKEND=x11
export QT_QPA_PLATFORM=xcb
export SDL_VIDEODRIVER=x11
export XINIT_UNIX_BACKEND=x11
rofi -modi "ssh,combi,run" -modi combi -show combi -combi-modi window,drun,run -disable-history -theme ~/.config/rofi/sidetab -font "Jost* Light 15"
