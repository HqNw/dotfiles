#!/bin/sh

folder="${HOME}/Pictures/backgrounds"
pic=$(ls $folder/* | shuf -n1)

if [[ ! `pidof swww` ]]; then
        swww init &
        sleep 1
fi

# swaybg --output '*' --mode fill --image $pic & &>/dev/null
swww img $pic &
