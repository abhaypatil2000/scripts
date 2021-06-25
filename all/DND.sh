#!/usr/bin/bash

dnd_status=$(gsettings get org.gnome.desktop.notifications show-banners)

if [ "$dnd_status" == "false" ]
then
    gsettings set org.gnome.desktop.notifications show-banners true
else
    gsettings set org.gnome.desktop.notifications show-banners false
fi