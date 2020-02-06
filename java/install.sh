#!/bin/sh

if [ -e "/etc/debian_version" ]
then
  sudo apt install -y curl gnupg unzip zip

fi

if ! [ -e "${HOME}/.sdkman" ]
then
  curl -s "https://get.sdkman.io" | bash
  sdk install java 12.0.2.hs-adpt
  sdk install sbt
  sdk install scala
fi

if ! [ -e "${HOME}/.bloop" ]
then
	curl -L https://github.com/scalacenter/bloop/releases/download/v1.4.0-RC1/install.py | python
	if [ $(uname) = "Linux" ]
	then
	  systemctl --user set-environment PATH=${HOME}/.sdkman/candidates/java/current/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/snap/bin
	  systemctl --user enable $HOME/.bloop/systemd/bloop.service
	  systemctl --user start bloop
	fi
fi
