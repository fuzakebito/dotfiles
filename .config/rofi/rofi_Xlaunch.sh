#!/bin/bash

export GDK_BACKEND=x11
export QT_QPA_PLATFORM=xcb
export SDL_VIDEODRIVER=x11
export XINIT_UNIX_BACKEND=x11
rofi -modi "combi,drun,run,window,ssh" -modi combi -show combi -combi-modi window,drun,run -theme Black-Simplicity -font "Jost* Light 15" -terminal "env WINIT_UNIX_BACKEND=x11 alacritty"
