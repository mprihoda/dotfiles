#!/bin/sh

if [ $(uname) = "Darwin"]
then
cp tmutil_exclude_devel_targets.plist /Library/LaunchDaemons/mph.tmutil.exclude.dev.plist
launchctl load -w /Library/LaunchDaemons/mph.tmutil.exclude.dev.plist
fi
