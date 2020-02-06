#!/bin/sh

if [ $(uname) = "Linux" ]
then
	if [ ! -d "${HOME}/bin" ]
	then
		mkdir -p "${HOME}/bin"
	fi

	sudo apt install -y fuse build-essential

	if [ ! -d "${HOME}/bin/nvim" ]
	then
		curl https://github.com/neovim/neovim/releases/download/v0.4.3/nvim.appimage -L -o "${HOME}/bin/nvim"
	fi
fi

if [ ! -d "~/.SpaceVim" ]
then
	curl -sLf https://spacevim.org/install.sh | bash
fi
