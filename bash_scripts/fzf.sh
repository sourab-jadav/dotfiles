#!/bin/bash

# Use fzf to select an item from a list
selected_item=$(printf "Apple\nBanana\nOrange\nGrape\nPineapple" | fzf)

# Use xdotool to paste the selected item into the terminal
printf "%s" "$selected_item" | xdotool type --delay 0

