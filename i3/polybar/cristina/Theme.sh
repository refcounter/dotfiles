#!/usr/bin/env bash
#  ╔═╗╦═╗╦╔═╗╔╦╗╦╔╗╔╔═╗  ╦═╗╦╔═╗╔═╗
#  ║  ╠╦╝║╚═╗ ║ ║║║║╠═╣  ╠╦╝║║  ║╣ 	https://github.com/gh0stzk/dotfiles
#  ╚═╝╩╚═╩╚═╝ ╩ ╩╝╚╝╩ ╩  ╩╚═╩╚═╝╚═╝
## This file will configure the options
## and launch the bars corresponding to each theme.

# Set compositor configuration
set_picom_config() {
		sed -i "$HOME"/.config/i3/picom.conf \
			-e "s/shadow-color = .*/shadow-color = \"#000000\"/g" \
			-e "s/corner-radius = .*/corner-radius = 6/g" \
			-e "s/\".*:class_g = 'Alacritty'\"/\"100:class_g = 'Alacritty'\"/g" \
			-e "s/\".*:class_g = 'FloaTerm'\"/\"100:class_g = 'FloaTerm'\"/g" \
			-e "s/\".*:class_g = 'Updating'\"/\"100:class_g = 'Updating'\"/g" \
			-e "s/\".*:class_g = 'MusicPlayer'\"/\"100:class_g = 'MusicPlayer'\"/g" \
			-e "s/\".*:class_g = 'Sysfetch'\"/\"100:class_g = 'Sysfetch'\"/g" \
			-e "s/\".*:class_g = 'scratch'\"/\"90:class_g = 'scratch'\"/g"
}

# Set dunst notification daemon config
set_dunst_config() {
		sed -i "$HOME"/.config/i3/dunstrc \
		-e "s/transparency = .*/transparency = 0/g" \
		-e "s/frame_color = .*/frame_color = \"#1f1d29\"/g" \
		-e "s/separator_color = .*/separator_color = \"#ea6f91\"/g" \
		-e "s/foreground='.*'/foreground='#9bced7'/g"
		
		sed -i '/urgency_low/Q' "$HOME"/.config/i3/dunstrc
		cat >> "$HOME"/.config/i3/dunstrc <<- _EOF_
				[urgency_low]
				timeout = 3
				background = "#1f1d69"
				foreground = "#eaeaea"

				[urgency_normal]
				timeout = 6
				background = "#1f1d69"
				foreground = "#eaeaea"

				[urgency_critical]
				timeout = 0
				background = "#1f1d29"
				foreground = "#eaeaea"
_EOF_
}

set_bg() {
  feh --bg-fill ~/.config/i3/polybar/cristina/walls/cri.webp
}

# Launch the bar and or eww widgets
launch_bars() {
    pkill eww
    pkill polybar
		$HOME/bin/eww/eww -c ~/.config/i3/polybar/cristina/widgets/ daemon &
		polybar -q main -c ~/.config/i3/polybar/cristina/config.ini &
}

### ---------- Apply Configurations ---------- ###

set_picom_config
set_dunst_config
set_bg
launch_bars
