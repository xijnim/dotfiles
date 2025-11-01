#!/usr/bin/env bash

pkill waybar
waybar -c $HOME/dotfiles/waybar/config.jsonc -s $HOME/dotfiles/waybar/style.css
