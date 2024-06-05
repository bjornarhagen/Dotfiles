# Bjørnar's dotfiles

## Dependencies

-   ~~i3-gaps~~ (Merged into i3)
-   i3
-   i3-lock
-   polybar
-   dunst
-   dunstify
-   PulseAudio
-   wal (pywal)
-   stow
-   python 3.5+
-   imagemagick
-   vim
-   urxvt (rxvt-unicode)

### Getting ready

-   `apt install rxvt-unicode zsh python3-pip fzf polybar`
-   `pip3 install pywal`

Setup i3 ppa

Follow: https://i3wm.org/docs/repositories.html

Then change `/etc/apt/sources.list.d/sur5r-i3.list`:

`echo "deb [arch=amd64 signed-by=/usr/share/keyrings/sur5r-keyring.gpg] https://debian.sur5r.net/i3/ jammy universe" > /etc/apt/sources.list.d/sur5r-i3.list`

This sets the arch, adds signed by and changes from http to https.

## How to install

1. Checkout the repo into for example `~/.dotfiles`.
1. Run install script: `./install.sh` (experimental), or make symbolic links manually. For example: `ln -s ~/.dotfiles/vim/.vimrc .vimrc`

## Usage guide

Mod4/Super key is the main modifier key, called $mod.

### Window management

-   $mod+Shift+minus - Increase gaps by 25 (minus because it decreases window sizes)
-   $mod+Shift+plus - Decrease gaps by 25
-   $mod+Shift+0 - Set gaps to 0
-   $mod+Shift+Down Increase vertical gaps by 25
-   $mod+Shift+Up - Decrease vertical gaps by 25
-   $mod+Shift+Left - Increase horizontal gaps by 25
-   $mod+Shift+Right - Decrease horizontal gaps by 25
-   $mod+Shift+C - Center windows / resets gaps
-   $mod+shift+space - Toggle floating (hold $mod to drag windows)

Look in the i3 config for more·

### Shortcuts

$mod+Shift+Q - Lock screen

The screen lock is a bit odd, but works. To unlock just type your password. There is no visible input area. So if you can see the screen lock, you can type your password right away, then press enter to unlock.

$mod+Shift+W - Kill focused window.

### Programs (CLI/TUI)

-   ranger (aliased to r) - File explorer
-   bluetooth-sync-fix ($mod+shift and search for it) - Fixes Bluetooth audio going out of sync with video

#### AlsaMixer

This is a great program for advanced audio settings

If you do F6 to select a sound card, you can select the Blue Yeti and adjust the monitor volume.

### Programs (GUI)

-   Timeshift - Backups (/etc/timeshift/timeshift.json)

### Non US letters

I've set the compose key to be caps lock.

Here some common ones:

-   Compose + o + / = ø
-   Compose + O + / = Ø
-   Compose + a + e = æ
-   Compose + A + E = Æ
-   Compose + a + a = å
-   Compose + A + A = Å

More info:

-   https://en.wikipedia.org/wiki/Compose_key#Common_compose_combinations
-   https://henrik242.dk/danish-and-other-special-characters-with-ubuntu-linux-on-macbook-pro/
