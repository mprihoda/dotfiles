#!/bin/sh

find $1 -type d -name target | xargs tmutil addexclusion -p
