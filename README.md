# Omarchy Setup

This repository contains my personal configuration and workflow adjustments for [Omarchy OS](https://omarchy.org), a modern, keyboard-driven Arch Linux environment built on Hyprland.

Omarchy already provides an excellent experience out of the box.
This project does not attempt to modify or replace its defaults, but instead adds a few small refinements and tools that improve my personal workflow.

---

## What's Included

- Custom theme: **Space Is The Place**
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

You can then select **Space Is The Place** from Omarchy’s theme selector.

---

## Notes

- All configuration remains compatible with the official Omarchy structure.
- This setup keeps most customization inside the **theme folder**, making it easy to manage.

---

## Credits

- **Omarchy OS** by [tahavr](https://github.com/tahavr)
- **Solarized Osaka** Neovim theme by [craftzdog](https://github.com/craftzdog/solarized-osaka.nvim)

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
