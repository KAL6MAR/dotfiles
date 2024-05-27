#!/bin/bash

sketchybar --add alias "Control Centre,WiFi" right \
	--rename "Control Centre,WiFi" wifi_alias \
	--set wifi_alias icon.drawing=on \
	label.drawing=off \
	alias.color=$WHITE \
	padding_left=10 \
	padding_right=3 \
	background.padding_right=0 \
	click_script="osascript -e 'tell application \"System Events\" to tell process \"Control Centre\" to perform action \"AXPress\" of menu bar item 3 of menu bar 1'"--subscribe wifi_alias wifi_change background.padding_left=0width=28
