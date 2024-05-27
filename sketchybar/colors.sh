#!/bin/bash

### Sonokai
# export BLACK=0xff181819
# export WHITE=0xffe2e2e3
# export RED=0xfffc5d7c
# export GREEN=0xff9ed072
# export BLUE=0xff76cce0
# export YELLOW=0xffe7c664
# export ORANGE=0xfff39660
# export MAGENTA=0xffb39df3
# export GREY=0xff7f8490
# export TRANSPARENT=0x00000000
# export BG0=0xff2c2e34
# export BG1=0xff363944
# export BG2=0xff414550

getcolor() {

	color_name=$1
	opacity=$2

	local o100=0xff
	local o75=0xbf
	local o50=0x80
	local o25=0x40
	local o10=0x1a
	local o0=0x00

	# Material Darker
	# local blue=#82aaff
	# local teal=#64ffda
	# local cyan=#89ddff
	# local grey=#3b4252
	# local green=#c3e88d
	# local yellow=#ffcb6b
	# local orange=#f78c6c
	# local red=#ff5370
	# local purple=#c792ea
	# local black=#0f111a
	# local trueblack=#000000
	# local white=#eeeeee
	local blue=#82aaff
	local teal=#c3e88d
	local cyan=#4fd6be
	local grey=#828bb8
	local green=#c3e88d
	local yellow=#ffc777
	local orange=#ff966c
	local red=#ff757f
	local purple=#c099ff
	local black=#1b1d2b
	local trueblack=#000000
	local white=#c8d3f5
	local bg0=#222436
	local bg1=#222436
	local bg2=#222436

	#Tokyo Night
	# local blue=#7dcfff
	# local teal=#73daca
	# local cyan=#b4f9f8
	# local grey=#565f89
	# local green=#9ece6a
	# local yellow=#e0af68
	# local orange=#ff9e64
	# local red=#f7768e
	# local purple=#bb9af7
	# local black=#1a1b26
	# local trueblack=#000000
	# local white=#cfc9c2

	# OK #f7768e	This keyword, HTML elements, Regex group symbol, CSS units, Terminal Red
	# OK #ff9e64	Number and Boolean constants, Language support constants
	# OK #e0af68	Function parameters, Regex character sets, Terminal Yellow
	# OK #9ece6a	Strings, CSS class names
	# OK #73daca	Object literal keys, Markdown links, Terminal Green
	# OK #b4f9f8	Regex literal strings
	#  #2ac3de	Language support functions, CSS HTML elements
	# OK #7dcfff	Object properties, Regex quantifiers and flags, Markdown headings, Terminal Cyan, Markdown code, Import/export keywords
	#  #7aa2f7	Function names, CSS property names, Terminal Blue
	# OK #bb9af7	Control Keywords, Storage Types, Regex symbols and operators, HTML Attributes, Terminal Magenta
	#  #c0caf5	Variables, Class names, Terminal White
	#  #a9b1d6	Editor Foreground
	#  #9aa5ce	Markdown Text, HTML Text
	#  #cfc9c2	Parameters inside functions (semantic highlighting only)
	#  OK #565f89	Comments
	#  #414868	Terminal Black
	#  #1a1b26	Editor Background (Night)

	case $opacity in
	80) local opacity=$o80 ;;
	75) local opacity=$o75 ;;
	50) local opacity=$o50 ;;
	25) local opacity=$o25 ;;
	15) local opacity=$o15 ;;
	10) local opacity=$o10 ;;
	0) local opacity=$o0 ;;
	*) local opacity=$o100 ;;
	esac

	case $color_name in
	blue) local color=$blue ;;
	teal) local color=$teal ;;
	cyan) local color=$cyan ;;
	grey) local color=$grey ;;
	green) local color=$green ;;
	yellow) local color=$yellow ;;
	orange) local color=$orange ;;
	red) local color=$red ;;
	purple) local color=$purple ;;
	black) local color=$black ;;
	trueblack) local color=$trueblack ;;
	white) local color=$white ;;
	bg0) local color=$bg0 ;;
	bg1) local color=$bg1 ;;
	bg2) local color=$bg2 ;;
	*)
		echo "Invalid color name: $color_name" >&2
		return 1
		;;
	esac

	echo $opacity${color:1}
}

### Catppuccin
# export BLACK=0xff181926
# export WHITE=0xffcad3f5
# export RED=0xffed8796
# export GREEN=0xffa6da95
# export BLUE=0xff8aadf4
# export YELLOW=0xffeed49f
# export ORANGE=0xfff5a97f
# export MAGENTA=0xffc6a0f6
# export GREY=0xff939ab7
# export CYAN=0xff94e2d5
# export TRANSPARENT=0x00000000
# export BG0=0x801e1e2e
# export BG1=0x801e1e2e
# export BG2=0x80494d64

### Tokyonight Moon
local blue=#82aaff
local teal=#c3e88d
local cyan=#4fd6be
local grey=#828bb8
local green=#c3e88d
local yellow=#ffc777
local orange=#ff966c
local red=#ff757f
local purple=#c099ff
local black=#1b1d2b
local trueblack=#000000
local white=#c8d3f5
local bg0=#222436
local bg1=#222436
local bg2=#222436

export BLACK=$(getcolor black 100)
export WHITE=$(getcolor white 100)
export RED=$(getcolor red 100)
export GREEN=$(getcolor green 100)
export BLUE=$(getcolor blue 100)
export YELLOW=$(getcolor yellow 100)
export ORANGE=$(getcolor orange 100)
export MAGENTA=$(getcolor purple 100)
export GREY=$(getcolor grey 100)
export CYAN=$(getcolor cyan 100)
export TRANSPARENT=$(getcolor trueblack 0)
export BG0=$(getcolor bg0 75)
export BG1=$(getcolor bg0 75)
export BG2=$(getcolor bg0 75)

# General bar colors
export BAR_COLOR=$BG0
export BAR_BORDER_COLOR=$BG2
export BACKGROUND_0=$BG0
export BACKGROUND_1=$BG1
export BACKGROUND_2=$BG2
export ICON_COLOR=$WHITE  # Color of all icons
export LABEL_COLOR=$WHITE # Color of all labels
export POPUP_BACKGROUND_COLOR=$BAR_COLOR
export POPUP_BORDER_COLOR=$WHITE
export SHADOW_COLOR=$BLACK
