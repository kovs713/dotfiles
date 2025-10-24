#!/bin/bash

# Get the directory from fzf
selected_dir=$(zoxide query -l | fzf)

# If no directory is selected, exit
if [ -z "$selected_dir" ]; then
    exit 0
fi

# Get the session name from the selected directory
session_name=$(basename "$selected_dir" | tr . _)

# Switch to the tmux session if it already exists, otherwise create it
if ! tmux has-session -t "=$session_name" 2>/dev/null; then
    tmux new-session -d -s "$session_name" -c "$selected_dir"
fi

if [ -n "$TMUX" ]; then
    tmux switch-client -t "=$session_name"
else
    tmux attach-session -t "=$session_name"
fi