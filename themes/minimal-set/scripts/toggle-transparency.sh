#!/usr/bin/env bash
# Toggle transparency for Omarchy Minimal Set

CONFIG="$HOME/.config/omarchy/themes/minimal-set/hyprland.conf"

# Transparent values
T_ACTIVE=0.72
T_INACTIVE=0.75
T_FS=0.75

# Opaque values
O_ACTIVE=0.92
O_INACTIVE=0.85
O_FS=1.0

# Are we currently transparent? (look at active_opacity in the file)
if grep -qE "^\s*active_opacity\s*=\s*${T_ACTIVE}\b" "$CONFIG"; then
  # -> switch to opaque
  # live-apply (works instantly, incl. fullscreen)
  hyprctl keyword decoration:active_opacity "$O_ACTIVE"
  hyprctl keyword decoration:inactive_opacity "$O_INACTIVE"
  hyprctl keyword decoration:fullscreen_opacity "$O_FS"

  # persist to file
  sed -i -E "s|^\s*active_opacity\s*=\s*${T_ACTIVE}\b|active_opacity = ${O_ACTIVE}|" "$CONFIG"
  sed -i -E "s|^\s*inactive_opacity\s*=\s*${T_INACTIVE}\b|inactive_opacity = ${O_INACTIVE}|" "$CONFIG"
  sed -i -E "s|^\s*fullscreen_opacity\s*=\s*${T_FS}\b|fullscreen_opacity = ${O_FS}|" "$CONFIG"

  notify-send "Omarchy" "🔆 Opaque Mode Enabled"
else
  # -> switch to transparent
  hyprctl keyword decoration:active_opacity "$T_ACTIVE"
  hyprctl keyword decoration:inactive_opacity "$T_INACTIVE"
  hyprctl keyword decoration:fullscreen_opacity "$T_FS"

  sed -i -E "s|^\s*active_opacity\s*=\s*${O_ACTIVE}\b|active_opacity = ${T_ACTIVE}|" "$CONFIG"
  sed -i -E "s|^\s*inactive_opacity\s*=\s*${O_INACTIVE}\b|inactive_opacity = ${T_INACTIVE}|" "$CONFIG"
  sed -i -E "s|^\s*fullscreen_opacity\s*=\s*${O_FS}\b|fullscreen_opacity = ${T_FS}|" "$CONFIG"

  notify-send "Omarchy" "⚪ Transparent Mode Enabled"
fi

# If the current window is fullscreen, re-assert the state *only if it was fullscreen*.
fs=$(hyprctl activewindow -j | jq -r '.fullscreen')
if [ "$fs" = "true" ] || [ "$fs" = "1" ]; then
  # no fullscreen flicker — just re-push the fullscreen opacity to be extra safe
  # (Hypr already applied via keyword, but this keeps things deterministic)
  : # do nothing else; keywords above already applied to fullscreen
fi
