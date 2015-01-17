#!/bin/sh

# Install conscript

if [ ! -e "$HOME/bin/cs" ]
then
    curl https://raw.githubusercontent.com/n8han/conscript/master/setup.sh | sh
fi

if [ ! -e "$HOME/bin/scalas" ]
then
    $HOME/bin/cs sbt/sbt --branch 0.13
fi
