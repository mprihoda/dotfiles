#!/bin/sh

POWERLINE_CONFIG=~/.config/powerline

if [ ! -e "${POWERLINE_CONFIG}" ]
then
  mkdir -p ${POWERLINE_CONFIG}
fi

cp -r themes ${POWERLINE_CONFIG}
