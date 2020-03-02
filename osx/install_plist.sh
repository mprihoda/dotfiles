#!/bin/sh

if [ $(uname) = "Darwin" ]
then
  LD="/Library/LaunchDaemons"
  cp $(dirname $0)/tmutil_exclude_devel_targets.plist "${LD}"/mph.tmutil.exclude.dev.plist
  launchctl load -w "${LD}"/mph.tmutil.exclude.dev.plist
fi
