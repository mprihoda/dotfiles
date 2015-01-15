#!/bin/sh

if [ ! -e ~/.vim/bundle ]
then
	mkdir -p ~/.vim/bundle
fi

if [ ! -e ~/.vim/bundle/Vundle.vim ]
then
	git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
fi

vim +PluginInstall +qall
