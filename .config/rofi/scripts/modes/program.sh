#!/bin/zsh

hyprctl dispatch exec "[workspace 1] brave"

hyprctl dispatch exec "[workspace special] alacritty --class alacritty"
hyprctl dispatch exec "[workspace special] alacritty --class alacritty"
sleep 1
hyprctl dispatch workspace 2
hyprctl dispatch exec "[workspace 2] code"
