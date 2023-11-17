# Bjørnar's dotfiles

## Dependencies

* i3-gaps
* i3-lock
* polybar
* dunst
* dunstify
* PulseAudio
* wal (pywal)
* stow

## Config

## Extra

### Screen brightness

xbacklight was not working for my laptop, so I had to make my own script, which writes the value to file.

This needs to be added to sudoers file:
USERNAME PC=(ALL) NOPASSWD: /home/USERNAME/bin/screen-brightness

## How to install

1. Checkout the repo into for example `~/.dotfiles`.
2. Make symbolic links. For example: `ln -s ~/.dotfiles/vim/.vimrc .vimrc`
