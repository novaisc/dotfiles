#!/bin/sh -e

#int variable
num=$RANDOM

#string variable
str="screen_locked_$num.png"
echo $str

# Take a screenshot
#scrot /tmp/screen_locked.png
scrot /tmp/$str

# Pixellate it 10x
#mogrify -scale 10% -scale 1000% /tmp/screen_locked.png
mogrify -scale 10% -scale 1000% /tmp/$str

# Lock screen displaying this image.
#i3lock -i /tmp/screen_locked.png
i3lock -i /tmp/$str

# Turn the screen off after a delay.
sleep 60; pgrep i3lock && xset dpms force off
