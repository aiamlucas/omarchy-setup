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

## Issues & Workarounds

### Suspend/Resume Problems (Ongoing Issue)

Problem when suspend/resume functionality (closing laptop lid):

**Issues encountered:**
1. Lock screen (Hyprlock) doesn't accept password after resume
2. Filesystem becomes read-only after waking up (`touch: cannot touch 'file': Read-only file system`)
3. Display doesn't resume - black screen or split screen artifacts (quadrant display with TTY text)
4. Compositor crashes on resume

**Note:** These issues persist across versions (observed in 3.0.x and 3.1.0). This appears to be a systemic issue with Omarchy's suspend/resume implementation, maybe with:
- BTRFS filesystems
- LUKS encryption (`/dev/mapper/root`)
- Hyprlock authentication

**Current Workaround: Disable Suspend Completely**

Suspend/resume has been disabled until these bugs are fixed in a future Omarchy release. Or until I have energy and time to debug it!

**Changes made:**

1. **Disabled system suspend:**
```
   sudo systemctl mask sleep.target suspend.target
```

2. **Configured lid close to do nothing:**
   
   File: `/etc/systemd/logind.conf`
```
   HandleLidSwitch=ignore
   HandleLidSwitchExternalPower=ignore
```
   
   Then restarted the service:
```
   sudo systemctl restart systemd-logind
```

**Result:** Closing the laptop lid no longer triggers suspend. The system stays awake and functional.

**Recommendation:** Keep laptop plugged in or manually shut down when not in use. Do not rely on suspend functionality.

**To revert when bug is fixed:**
```
# Re-enable suspend
sudo systemctl unmask sleep.target suspend.target

# Restore default lid behavior in /etc/systemd/logind.conf
HandleLidSwitch=suspend
HandleLidSwitchExternalPower=suspend

# Restart service
sudo systemctl restart systemd-logind
```
