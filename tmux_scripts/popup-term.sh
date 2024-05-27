#!/bin/bash
session="_popup_$(tmux display -p '#S')"
CURRENT_DIR=$(tmux display-message -p "#{pane_current_path}")

if ! tmux has -t "$session" 3>/dev/null; then
	session_id="$(tmux new-session -c $CURRENT_DIR -dP -s "$session" -F '#{session_id}')"
	tmux set-option -s -t "$session_id" key-table popup
	tmux set-option -s -t "$session_id" status off
	tmux set-option -s -t "$session_id" prefix None
	session="$session_id"
fi

exec tmux attach -t "$session" >/dev/null
