#!/bin/bash

if pgrep -x i3status >/dev/null ; then
	killall -USR1 i3status
fi
