#!/bin/bash

# Verifique o layout atual
current_layout=$(setxkbmap -query | grep layout | awk '{print $2}')

# Altere entre layouts
if [ "$current_layout" = "us" ]; then
    setxkbmap -layout br
else
    setxkbmap -layout us
fi
