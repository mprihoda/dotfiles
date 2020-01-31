#!/bin/sh

if [ -e "/etc/debian_version" ]
then

  sudo apt install -y git default-jdk-headless neovim python3-neovim nodejs npm yarnpkg zsh gnupg software-properties-common tmux
