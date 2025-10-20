#!/usr/bin/env bash
# Toggle between 3 opacity levels for Omarchy Minimal Set

CONFIG="$HOME/.config/omarchy/themes/minimal-set/hyprland.conf"

# --- Transparency Presets ---
T_ACTIVE=0.72
T_INACTIVE=0.75
T_FS=0.75

# --- Semi-Opaque Presets ---
O_ACTIVE=0.92
O_INACTIVE=0.85
O_FS=1.0

# --- Fully Solid Presets ---
S_ACTIVE=1.0
S_INACTIVE=1.0
S_FS=1.0

# Read current active opacity from config
CURRENT=$(grep -E "^\s*active_opacity\s*=" "$CONFIG" | awk -F'= ' '{print $2}' | tr -d ' ')

# Helper function to apply new values both live and in config
apply_opacity() {
  local A=$1
  local I=$2
  local F=$3
  local MSG=$4

  # live apply
  hyprctl keyword decoration:active_opacity "$A" >/dev/null
  hyprctl keyword decoration:inactive_opacity "$I" >/dev/null
  hyprctl keyword decoration:fullscreen_opacity "$F" >/dev/null

  # persist to config
  sed -i -E "s|^\s*active_opacity\s*=.*|active_opacity = ${A}|" "$CONFIG"
  sed -i -E "s|^\s*inactive_opacity\s*=.*|inactive_opacity = ${I}|" "$CONFIG"
  sed -i -E "s|^\s*fullscreen_opacity\s*=.*|fullscreen_opacity = ${F}|" "$CONFIG"

  notify-send "Omarchy" "$MSG"
}

# --- Logic: Cycle through 3 modes ---
if [[ "$CURRENT" == "$T_ACTIVE" ]]; then
  # Transparent → Opaque
  apply_opacity "$O_ACTIVE" "$O_INACTIVE" "$O_FS" "🔆 Opaque Mode Enabled"
elif [[ "$CURRENT" == "$O_ACTIVE" ]]; then
  # Opaque → Solid
  apply_opacity "$S_ACTIVE" "$S_INACTIVE" "$S_FS" "🧱 Solid Mode Enabled"
else
  # Solid (or unknown) → Transparent
  apply_opacity "$T_ACTIVE" "$T_INACTIVE" "$T_FS" "🌫️ Transparent Mode Enabled"
fi

# Handle fullscreen state
fs=$(hyprctl activewindow -j | jq -r '.fullscreen')
if [ "$fs" = "true" ] || [ "$fs" = "1" ]; then
  # fullscreen already handled by hyprctl above
  :
fi
##!/usr/bin/env bash
## Toggle transparency for Omarchy Minimal Set
#
#CONFIG="$HOME/.config/omarchy/themes/minimal-set/hyprland.conf"
#
## Transparent values
#T_ACTIVE=0.72
#T_INACTIVE=0.75
#T_FS=0.75
#
## Opaque values
#O_ACTIVE=0.92
#O_INACTIVE=0.85
#O_FS=1.0
#
## Are we currently transparent? (look at active_opacity in the file)
#if grep -qE "^\s*active_opacity\s*=\s*${T_ACTIVE}\b" "$CONFIG"; then
#  # -> switch to opaque
#  # live-apply (works instantly, incl. fullscreen)
#  hyprctl keyword decoration:active_opacity "$O_ACTIVE"
#  hyprctl keyword decoration:inactive_opacity "$O_INACTIVE"
#  hyprctl keyword decoration:fullscreen_opacity "$O_FS"
#
#  # persist to file
#  sed -i -E "s|^\s*active_opacity\s*=\s*${T_ACTIVE}\b|active_opacity = ${O_ACTIVE}|" "$CONFIG"
#  sed -i -E "s|^\s*inactive_opacity\s*=\s*${T_INACTIVE}\b|inactive_opacity = ${O_INACTIVE}|" "$CONFIG"
#  sed -i -E "s|^\s*fullscreen_opacity\s*=\s*${T_FS}\b|fullscreen_opacity = ${O_FS}|" "$CONFIG"
#
#  notify-send "Omarchy" "🔆 Opaque Mode Enabled"
#else
#  # -> switch to transparent
#  hyprctl keyword decoration:active_opacity "$T_ACTIVE"
#  hyprctl keyword decoration:inactive_opacity "$T_INACTIVE"
#  hyprctl keyword decoration:fullscreen_opacity "$T_FS"
#
#  sed -i -E "s|^\s*active_opacity\s*=\s*${O_ACTIVE}\b|active_opacity = ${T_ACTIVE}|" "$CONFIG"
#  sed -i -E "s|^\s*inactive_opacity\s*=\s*${O_INACTIVE}\b|inactive_opacity = ${T_INACTIVE}|" "$CONFIG"
#  sed -i -E "s|^\s*fullscreen_opacity\s*=\s*${O_FS}\b|fullscreen_opacity = ${T_FS}|" "$CONFIG"
#
#  notify-send "Omarchy" "⚪ Transparent Mode Enabled"
#fi
#
## If the current window is fullscreen, re-assert the state *only if it was fullscreen*.
#fs=$(hyprctl activewindow -j | jq -r '.fullscreen')
#if [ "$fs" = "true" ] || [ "$fs" = "1" ]; then
#  # no fullscreen flicker — just re-push the fullscreen opacity to be extra safe
#  # (Hypr already applied via keyword, but this keeps things deterministic)
#  : # do nothing else; keywords above already applied to fullscreen
#fi
