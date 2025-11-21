# Waybar Keyboard Layout Switch

This directory contains a small configuration snippet for Waybar and Hyprland to allow switching between **US normal keys** and **US intl (dead keys)** directly from the bar.

## Waybar Configuration (`config.jsonc`)

Add the following module to enable layout display + click-to-switch:

```
"hyprland/language": {
  "format": "{}",
  "format-en": "☰",
  "format-en-intl": "☷",
  "on-click": "hyprctl switchxkblayout at-translated-set-2-keyboard next"
},
```

- **☰** = US normal  
- **☷** = US intl (dead keys)  
- Clicking the icon cycles to the next layout.

Ensure this module is included in your Waybar `"modules-right"` (or wherever you prefer).

## Hyprland Input Configuration

To support toggling between normal and intl-deadkeys layouts, set:

```
input {
  kb_layout = us, us
  kb_variant = ,intl
  kb_options = caps:escape

  repeat_rate = 40
  repeat_delay = 600
  numlock_by_default = true
  sensitivity = 0.55
  accel_profile = adaptative

  touchpad {
    natural_scroll = true
    scroll_factor = 0.7
  }
}
```

- **kb_layout = us, us** → two layouts, both "us"  
- **kb_variant = ,intl** → first is empty (normal), second uses intl deadkeys  
- Combined:  
  1. `us`  
  2. `us-intl`  
- Waybar displays the correct icon and toggles them on click.

