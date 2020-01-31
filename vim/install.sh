#!/bin/sh

if [ ! -e ~/.vim ]
then
    mkdir ~/.vim
fi

if [ ! -e ~/.config ]
then
    mkdir ~/.config
fi

if [ ! -e ~/.config/nvim ]
then
    mkdir ~/.config/nvim
fi

if [ ! -e ~/.config/nvim/init.vim ]
then
    ln -s $(pwd)/vim/init.vim ~/.config/nvim
fi

if [ ! -e ~/.vim/bundle ]
then
	mkdir -p ~/.vim/bundle
fi

if [ ! -e ~/.vim/bundle/Vundle.vim ]
then
	git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
fi

#nvim +PlugUpdate +qall
