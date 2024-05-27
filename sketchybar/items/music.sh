#!/bin/env/bash

music=(
	script="$PLUGIN_DIR/music.sh"
	popup.align=center
	padding_left=$PADDINGS
	label.padding_right=10
	label.padding_left=10
	padding_right=$(($PADDINGS * 2))
	drawing=off
	label="Loading…"
	background.image=media.artwork
	background.image.scale=0.70
	background.image.corner_radius=10
	background.color="$BACKGROUND_1"
	background.border_color="$TRANSPARENT"
	icon.padding_left=20
	icon.padding_right=10
	label.max_chars=20
	height=32
	updates=on
	--subscribe music media_change
)

sketchybar \
	--add item music right \
	--set music "${music[@]}"
