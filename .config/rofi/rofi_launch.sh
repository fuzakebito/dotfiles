#!/bin/bash

rofi -modi "combi,drun,run,window,ssh" -show combi -combi-modi window,drun,run -theme Black-Simplicity -font "Jost* Light 15" -terminal "env WINIT_UNIX_BACKEND=x11 alacritty"
