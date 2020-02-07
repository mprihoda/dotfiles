#!/bin/sh

# Install scala

if [ $(uname) = "Darwin" ]
then

if [ ! -e /usr/local/bin/scala ]
then
    brew install scala
fi

# Install conscript

if [ ! -e "$CONSCRIPT_HOME/bin/cs" ]
then
    wget https://raw.githubusercontent.com/foundweekends/conscript/master/setup.sh -O - | sh
fi

if [ ! -e "$CONSCRIPT_HOME/bin/scalas" ]
then
    $HOME/bin/cs sbt/sbt --branch 1.1.1
fi
fi

if [ ! -e "${HOME}/.sbt/1.0" ]
then
  mkdir -p "${HOME}/.sbt/1.0/plugins"
  cp sbt/*.sbt "${HOME}/.sbt/1.0"
  cp sbt/plugins/*.sbt "${HOME}/.sbt/1.0/plugins"
fi
