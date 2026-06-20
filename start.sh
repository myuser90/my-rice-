#!/usr/bin/bash
dbus-run-session start-hyprland
pipewire &
disown
pipewire-pulse &
disown
wireplumber &
disown
# this script is for an issue i had when starting hyprland 
# for icons and sound not working as intented 
