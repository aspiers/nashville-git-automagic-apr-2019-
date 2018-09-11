#!/bin/bash

cd ~/OpenStack/git/cinder
git checkout master
git branch -D stable/pike
git tag -d to-backport
pkill -f git-deps
