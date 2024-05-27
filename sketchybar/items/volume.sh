#!/bin/bash

sketchybar --add alias "Control Centre,Sound" right \
	--rename "Control Centre,Sound" volume_alias \
	--set volume_alias icon.drawing=on \
	label.drawing=on \
	alias.color="$WHITE" \
	background.padding_right=0 \
	background.padding_left=0 \
	width=35

# #!/bin/bash
#
# volume_slider=(
# 	script="$PLUGIN_DIR/volume.sh"
# 	updates=on
# 	label.drawing=off
# 	icon.drawing=off
# 	slider.highlight_color=$GREEN
# 	slider.background.height=8
# 	slider.background.corner_radius=12
# 	slider.background.color=$(getcolor white 25)
# 	padding_left=0
# 	padding_right=5
# )
#
# volume_icon=(
# 	click_script="$PLUGIN_DIR/volume_click.sh"
# 	icon=$VOLUME_100
# 	icon.font="$FONT:Regular:14.0"
# 	label.drawing=off
# )
#
# sketchybar --add slider volume right \
# 	--set volume "${volume_slider[@]}" \
# 	--subscribe volume volume_change \
# 	mouse.clicked \
# 	mouse.entered \
# 	mouse.exited \
# 	mouse.exited.global \
# 	\
# 	--add item volume_icon right \
# 	--set volume_icon "${volume_icon[@]}"
