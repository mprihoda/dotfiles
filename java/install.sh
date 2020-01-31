#!/bin/sh

if [ $(uname) = "Darwin" ]
then

if test ! $(which jenv)
then
  echo "  Installing jenv for you."
  brew install jenv > /tmp/jenv-install.log
fi

else

  #if [ ! -d "${HOME}/.jenv" ]
  #then
  #  git clone https://github.com/gcuisinier/jenv.git ~/.jenv
  #fi

  if [ -e "/etc/debian_version" ]
  then
    sudo apt install -y default-jdk-headless curl gnupg unzip zip

    if ! [ -e "${HOME}/.sdkman" ]
    then
      curl -s "https://get.sdkman.io" | bash
    fi
  fi

fi
