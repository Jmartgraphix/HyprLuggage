#!/bin/bash
# mako - symlink theme-specific config and reload

command -v makoctl &>/dev/null || exit 0

# For static themes: symlink theme-specific mako config
# For dynamic theme: matugen generates config directly to ~/.config/mako/config
src="$CURRENT_LINK/.config/mako/config"
if [[ -f "$src" ]]; then
    ln -sf "$src" "$HOME/.config/mako/config"
fi

# Reload mako to pick up new config
pgrep -x mako &>/dev/null && makoctl reload 2>/dev/null || exit 0
exit 0
