# Omarchy Setup

This repository contains my personal dotfiles and workflow adjustments for [Omarchy OS](https://omarchy.org), an **Arch-based** desktop built around the **Hyperland** Wayland compositor.

Omarchy already provides an excellent experience (out of the box).
This project doesn't attempt to modify or replace its defaults; it adds small refinements that fit my workflow.

---

## What's Included

- Custom theme: **Minimal Set**
- Neovim configuration
- tmux configuration
- Helper scripts

---

## Installation

Clone this repository anywhere, for example inside your config directory:

```
git clone git@github.com:aiamlucas/omarchy-setup.git ~/.config/omarchy-setup
```

Then create symbolic links to the desired locations:

```
ln -s ~/.config/omarchy-setup/themes/spaceistheplace ~/.config/omarchy/themes/spaceistheplace
ln -s ~/.config/omarchy-setup/nvim ~/.config/nvim
ln -s ~/.config/omarchy-setup/tmux/.tmux.conf ~/.tmux.conf
```

Then select **Minimal Set** from Omarchy’s theme selector.

---

## Notes

- All configuration remains compatible with the official Omarchy structure.

---

## Credits

- **Omarchy OS** by [tahavr](https://github.com/tahavr)
- **Solarized Osaka** Neovim theme by [craftzdog](https://github.com/craftzdog/solarized-osaka.nvim)

---

## Installation Steps

1. Install tmux:
   ``` ```
   sudo pacman -S tmux
   ``` ```

2. Install TPM (Tmux Plugin Manager):
   ``` ```
   git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
   ``` ```

3. Install vim-tmux-navigator plugin:
   ``` ```
   git clone https://github.com/christoomey/vim-tmux-navigator ~/.tmux/plugins/vim-tmux-navigator
   ``` ```

4. Place this configuration in:
   ``` ```
   ~/.tmux.conf
   ``` ```

5. Reload and install plugins:
   Inside tmux, press:
   ``` ```
   Ctrl + a  Shift + I
   ``` ```
   (capital I installs all plugins via TPM)

---
