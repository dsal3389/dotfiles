#!/bin/sh

XPROFILE=$HOME/.xprofile

[ -f $XPROFILE ] && . $XPROFILE

exec dwm
