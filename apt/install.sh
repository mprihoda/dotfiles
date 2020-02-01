#!/bin/sh

if [ -e "/etc/debian_version" ]
then

  sudo apt install -y git neovim python3-neovim zsh gnupg software-properties-common tmux

fi
