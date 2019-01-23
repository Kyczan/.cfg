#!/bin/bash

# load custom theme
xrdb $HOME/.Xresources

numlockx on # turn on numlock
setxkbmap -layout pl -option caps:escape # caps lock works as escape

# run i3
exec i3
