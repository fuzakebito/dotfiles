#!/bin/sh

if ! updates=$(rsync -au --delete /var/lib/pacman/local $HOME/.cache/pacman-fake/fakedb && fakeroot pacman -Sy --dbpath ~/.cache/pacman-fake/fakedb > /dev/null && yay -Qub ~/.cache/pacman-fake/fakedb | wc -l ); then
    updates=0
fi

if [ "$updates" -gt 0 ]; then
    echo " $updates updates"$'\n\n'"#FF9800"
else
    echo " up to date "$'\n\n'"#00BCD4"
fi
