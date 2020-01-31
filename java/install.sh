#!/bin/sh

if [ $(uname) = "Darwin" ]
then

if test ! $(which jenv)
then
  echo "  Installing jenv for you."
  brew install jenv > /tmp/jenv-install.log
fi

fi
