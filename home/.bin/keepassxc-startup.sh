#!/bin/bash

dir=$HOME/Documents/KeepassXC

gnome-keyring-query get keepass | keepassxc --pw-stdin $dir/Passwords.kdbx --keyfile $dir/keyfile-extra-protection &

while [ true ]
do
	sleep 3
	status=`wmctrl -l | grep KeePass`
	if [ "$status" != "" ]; then
		break
	fi
done
wmctrl -c "Passwords.kdbx - KeePass"
