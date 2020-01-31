#!/bin/sh

if [ -e "/etc/debian_version" ]
then
  sudo apt install -y default-jdk-headless curl gnupg unzip zip

fi

if ! [ -e "${HOME}/.sdkman" ]
then
  curl -s "https://get.sdkman.io" | bash
fi
