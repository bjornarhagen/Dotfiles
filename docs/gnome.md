# GNOME guide

If you are using GNOME instead of Sway, here are some tips and tricks.

## Keyboard shortcuts

By default alt+tab switches between applications, which is annoyting when you have multiple instances of a single application. To fix this go to settings -> keyboard shortcuts -> search for "switch windows" and assign that to alt+tab instead.

## Custom theme

1. Make sure GNOME Shell Extentions is installed (should be by default): https://extensions.gnome.org/
2. Install https://extensions.gnome.org/extension/19/user-themes/
3. Install GNOME Tweaks Tool: `sudo apt install gnome-tweaks`
4. Install a theme (for example "Orchis-theme": https://www.gnome-look.org/p/1357889/)
    1. Start a terminal
    2. `mkdir ~/.themes`
    3. `cd ~/.themes`
    4. `git clone git@github.com:vinceliuice/Orchis-theme.git`
    5. `cd Orchis-theme`
    6. `./install.sh -d ~/.themes/ --tweaks macos primary submenu`
5. Open GNOME Tweaks tool, go to appearance and select the theme

## Custom icons

1. Follow the "Custom theme" guide.
2. Make the folder `~/.icons`
3. Download and unzip in the .icons directory

## Good extentions

-   https://extensions.gnome.org/extension/1401/bluetooth-quick-connect/
-   https://extensions.gnome.org/extension/517/caffeine/
-   https://extensions.gnome.org/extension/307/dash-to-dock/ (Disable Ubuntu Dock if you have that)
-   https://extensions.gnome.org/extension/3193/blur-my-shell/ (Settings might need to be changed in order to be compatible with a custom theme)
-   https://extensions.gnome.org/extension/906/sound-output-device-chooser/
-   https://extensions.gnome.org/extension/1460/vitals/

## Custom applications in sidebar

You can also use this method to change the icon of an application.

Make a file like `fileName.desktop` in `~/.local/share/applications/`:

```shell
[Desktop Entry]
Comment=Open HeidiSQL
Terminal=false
Name=HeidiSQL
Exec=steam steam://rungameid/13631804968619999232
Type=Application
Icon=/~Pictures/application-icons/HeidiSQL.png
NoDisplay=false
```

To make it appear as pinned/favorite in the sidebar, just search for it and drag the search result icon into the sidebar
