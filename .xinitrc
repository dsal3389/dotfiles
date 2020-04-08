#!/bin/sh

xprofile=$HOME/.xprofile
userresources=$HOME/.Xresources

[ -f "$xprofile" ] && . "$xprofile"
[ -f "$userresources" ] && xrdb -merge "$userresources"

exec i3

