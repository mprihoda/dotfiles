#!/bin/sh

if test ! -e ~/.ssh
then
	echo "Creating .ssh directory"
	mkdir ~/.ssh && chmod 0700 ~/.ssh
fi

for i in config authorized_keys
do
	if test ! -e ~/.ssh/$i
	then
		echo "Copying $i to .ssh directory"
		cp ssh/$i ~/.ssh/$i
	fi
done

ln -sf ~/.dotfiles/ssh/rc ~/.ssh/rc
