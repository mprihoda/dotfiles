#!/bin/sh

if [ ! -e "${HOME}/.nvm" ]
then
  curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.35.2/install.sh | bash
  curl -o- -L https://yarnpkg.com/install.sh | bash
fi
