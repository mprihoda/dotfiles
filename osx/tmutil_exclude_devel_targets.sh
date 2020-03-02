#!/bin/sh

if [ -z "$1" ]
then
  echo "Usage: $0 <dev dir>"
  exit 1
fi

for i in `find $1 -type d -name .git`
do
  p=$(dirname $i)
  tmutil addexclusion -p $p/.bloop
  tmutil addexclusion -p $p/.metals
  tmutil addexclusion -p $p/out
  find ~/Devel/commercial/fiftyforms/platform -type d -name target | grep -v out/ | grep -v .bloop/ | xargs tmutil addexclusion -p
done
