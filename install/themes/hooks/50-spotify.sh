#!/bin/bash
# Spotify theme - live reload via spicetify watch mode

command -v spicetify &>/dev/null || exit 0

src="$CURRENT_LINK/.config/spicetify/Themes/hyprluggage"
dest="$HOME/.config/spicetify/Themes/hyprluggage"

[[ -d "$src" ]] || exit 0

mkdir -p "$dest"
cp -r "$src"/* "$dest/"

spicetify config current_theme hyprluggage color_scheme base &>/dev/null
spicetify config inject_css 1 replace_colors 1 &>/dev/null

if pgrep -x spotify &>/dev/null; then
    # Live reload without restarting Spotify
    pgrep -f "spicetify.*watch" &>/dev/null || setsid spicetify -q watch -s &>/dev/null </dev/null &
else
    spicetify apply -n &>/dev/null &
fi

exit 0
