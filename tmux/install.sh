#!/bin/sh

if [ $(uname) = "Linux" ]
then
  sudo apt install -y powerline python3-powerline python-powerline
fi

if [ $(uname) = "Darwin" -a ! -e "${HOME}/.tmux.local.conf" ]
then
  echo 'set-option -g default-command "reattach-to-user-namespace -l zsh"' >> "${HOME}/.tmux.local.conf"
fi
