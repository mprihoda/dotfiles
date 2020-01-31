#!/bin/sh

POWERLINE_CONFIG=~/.config/powerline

if [ ! -e "${POWERLINE_CONFIG}" ]
then
  mkdir -p ${POWERLINE_CONFIG}
fi

cp -r powerline/themes ${POWERLINE_CONFIG}
