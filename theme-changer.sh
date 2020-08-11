#!/bin/bash

# set -e

PID=$(pgrep gnome-session | tail -n1)
export DBUS_SESSION_BUS_ADDRESS=$(grep -z DBUS_SESSION_BUS_ADDRESS /proc/$PID/environ|cut -d= -f2-)

alacritty=~/.config/alacritty

configure_theme() {
   currenttime=$(date +%H:%M)
   if [[ "$currenttime" > "18:00" ]] || [[ "$currenttime" < "06:00" ]]; then
    cp ${alacritty}/dark.yml ${alacritty}/alacritty.yml
    gsettings set org.gnome.shell.extensions.user-theme name "Mojave-dark"
    gsettings set org.gnome.desktop.interface gtk-theme "Mojave-dark"
   else
    cp ${alacritty}/light.yml ${alacritty}/alacritty.yml
    gsettings set org.gnome.shell.extensions.user-theme name "Mojave-light"
    gsettings set org.gnome.desktop.interface gtk-theme "Mojave-light"
   fi
}

configure_theme
