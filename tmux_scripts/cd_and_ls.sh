#!/bin/bash

# Define the folder you want to choose directories from
session="_Obsidian_$(tmux display -p '#S')"
DIRECTORY="~/Developer/Obsidian/"

# Prompt user to select a directory using fzf (or any other fuzzy finder)

# Create a new tmux window named "Obsidian" and cd into the selected directory
# tmux new-window -n "Obsidian"
# tmux send-keys -t "cd ${selected_dir}" Enter

if ! tmux has -t "$session" 2>/dev/null; then
	selected_dir=$(ls ~/Developer/Obsidian | fzf +m)

	# If no directory is selected, exit
	if [ -z "$selected_dir" ]; then
		exit 0
	fi
	session_id=$(tmux new-session -dP -s "$session" -F "#{session_id}")
	tmux set-option -s -t "$session_id" key-table Obsidian
	tmux set-option -s -t "$session_id" status off
	tmux set-option -s -t "$session_id" prefix None

	tmux send-keys -t "$session_id" "cd ~/Developer/Obsidian/${selected_dir} && clear" Enter
	session="$session_id"
fi

exec tmux attach -t "$session" >/dev/null
