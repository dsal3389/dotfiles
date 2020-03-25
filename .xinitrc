#!/bin/sh

xprofile=$HOME/.xprofile
userresources=$HOME/.Xdefaults

[ -f "$xprofile" ] && . "$xprofile"
[ -f "$userresources" ] && xrdb -merge "$userresources"

exec i3

