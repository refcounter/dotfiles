#!/usr/bin/env bash
#   ╦╔═╗╔╗╔  ╦═╗╦╔═╗╔═╗
#   ║╠═╣║║║  ╠╦╝║║  ║╣ 	https://github.com/gh0stzk/dotfiles
#  ╚╝╩ ╩╝╚╝  ╩╚═╩╚═╝╚═╝
## This file will configure the options
## and launch the bars corresponding to each theme.

# Set dunst notification daemon config
set_dunst_config() {
		sed -i "$HOME"/.config/i3/dunstrc \
		-e "s/transparency = .*/transparency = 8/g" \
		-e "s/frame_color = .*/frame_color = \"#070219\"/g" \
		-e "s/separator_color = .*/separator_color = \"#fb007a\"/g" \
		-e "s/font = .*/font = JetBrainsMono Nerd Font Medium 9/g" \
		-e "s/foreground='.*'/foreground='#f9f9f9'/g"
		
		sed -i '/urgency_low/Q' "$HOME"/.config/i3/dunstrc
		cat >> "$HOME"/.config/i3/dunstrc <<- _EOF_
				[urgency_low]
				timeout = 3
				background = "#070219"
				foreground = "#c0caf5"

				[urgency_normal]
				timeout = 6
				background = "#070219"
				foreground = "#c0caf5"

				[urgency_critical]
				timeout = 0
				background = "#070219"
				foreground = "#c0caf5"
_EOF_
}

# Launch the bar
launch_bars() {
  pkill polybar
	polybar -q main -c ~/.config/i3/polybar/jan/config.ini &
}

set_bg() {
  feh --bg-fill $HOME/.config/i3/polybar/jan/walls/jan.webp
}


### ---------- Apply Configurations ---------- ###

set_dunst_config
set_bg
launch_bars
