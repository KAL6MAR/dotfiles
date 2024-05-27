#!/bin/bash
#
# Load global styles, colors and icons
source "$CONFIG_DIR/globalstyles.sh"

POPUP_OFF='sketchybar --set logo popup.drawing=off'

logo=(
	label.font="JetBrainsMono Nerd Font:Regular:13"
	padding_left=8
	padding_right=8
	icon.padding_left=0
	icon.color=$WHITE
	scroll_texts=on
	icon=
	icon.font="JetBrainsMono Nerd Font:Regular:14.0"
	label.drawing=off
	popup.align=left
	click_script="sketchybar --set logo popup.drawing=toggle"
	--subscribe logo mouse.exited
	mouse.exited.global
)

logo_about=(
	label.font="JetBrainsMono Nerd Font:Regular:13"
	padding_left=8
	padding_right=8
	icon.padding_left=0
	icon.color=$CYAN
	background.color=$BACKGROUND_2
	scroll_texts=on
	icon=􀅴
	label="About This Mac"
	click_script="open x-apple.systempreferences:com.apple.SystemProfiler.AboutExtension; $POPUP_OFF"
	background.height=1
	width=180
	background.color="$(getcolor white 25)"
	background.y_offset=-16
)

logo_settings=(
	label.font="JetBrainsMono Nerd Font:Regular:13"
	padding_left=8
	padding_right=8
	icon.padding_left=0
	icon.color=$CYAN
	background.color=$BACKGROUND_2
	scroll_texts=on
	icon=􀍟
	label="System Settings"
	click_script="open -a 'System Settings'; $POPUP_OFF"
)

logo_sleep=(
	label.font="JetBrainsMono Nerd Font:Regular:13"
	padding_left=8
	padding_right=8
	icon.padding_left=0
	icon.color=$CYAN
	background.color=$BACKGROUND_2
	scroll_texts=on
	icon=􀜚
	label="Sleep"
	click_script="pmset sleepnow; $POPUP_OFF"
)

logo_restart=(
	label.font="JetBrainsMono Nerd Font:Regular:13"
	padding_left=8
	padding_right=8
	icon.padding_left=0
	icon.color=$CYAN
	background.color=$BACKGROUND_2
	scroll_texts=on
	icon=􀣨
	label="Restart…"
	click_script="osascript -e 'tell app \"loginwindow\" to «event aevtrrst»'; $POPUP_OFF"
)

logo_shutdown=(
	label.font="JetBrainsMono Nerd Font:Regular:13"
	padding_left=8
	padding_right=8
	icon.padding_left=0
	icon.color=$CYAN
	background.color=$BACKGROUND_2
	scroll_texts=on
	icon=􀷃
	label="Shut Down…"
	click_script="osascript -e 'tell app \"loginwindow\" to «event aevtrsdn»'; $POPUP_OFF"
)

logo_lockscreen=(
	label.font="JetBrainsMono Nerd Font:Regular:13"
	padding_left=8
	padding_right=8
	icon.padding_left=0
	icon.color=$CYAN
	background.color=$BACKGROUND_2
	scroll_texts=on
	icon=􀼑
	label="Lock Screen    􀆍􀆔Q"
	click_script="osascript -e 'tell application \"System Events\" to keystroke \"q\" using {command down,control down}'; $POPUP_OFF"
)

logo_logout=(
	label.font="JetBrainsMono Nerd Font:Regular:13"
	padding_left=8
	padding_right=8
	icon.padding_left=0
	icon.color=$CYAN
	background.color=$BACKGROUND_2
	scroll_texts=on
	icon=􀉭
	label="Log Out ${USER}… 􀆝􀆔Q"
	click_script="osascript -e 'tell app \"System Events\" to log out'; $POPUP_OFF"
	background.height=1
	width=180
	background.color="$(getcolor white 25)"
	background.y_offset=-16
)

logo_refresh=(
	label.font="JetBrainsMono Nerd Font:Regular:13"
	padding_left=8
	padding_right=8
	icon.padding_left=0
	icon.color=$CYAN
	background.color=$BACKGROUND_2
	scroll_texts=on
	icon=􀅈
	label="Refresh Sketchybar"
	click_script="$POPUP_OFF; sketchybar --update"
)

sketchybar \
	--add item logo left \
	--set logo "${logo[@]}" \
	\
	--add item logo.about popup.logo \
	--set logo.about "${logo_about[@]}" \
	\
	--add item logo.settings popup.logo \
	--set logo.settings "${logo_settings[@]}" \
	\
	--add item logo.sleep popup.logo \
	--set logo.sleep "${logo_sleep[@]}" \
	\
	--add item logo.restart popup.logo \
	--set logo.restart "${logo_restart[@]}" \
	\
	--add item logo.shut_down popup.logo \
	--set logo.shut_down "${logo_shutdown[@]}" \
	\
	--add item logo.lock_screen popup.logo \
	--set logo.lock_screen "${logo_lockscreen[@]}" \
	\
	--add item logo.logout popup.logo \
	--set logo.logout "${logo_logout[@]}" \
	\
	--add item logo.refresh popup.logo \
	--set logo.refresh "${logo_refresh[@]}"
