#!/bin/bash

DEMO_DIR=$HOME/nashville-git/

cd ~/OpenStack/git/cinder
git checkout master
git branch -D stable/pike || :
git tag -d to-backport || :

mkdir -p $DEMO_DIR
cd $DEMO_DIR
ln -sf ~/.GIT/adamspiers.org/nashville-git-automagic-april-2019/bin/create-repo.sh

./create-repo.sh </dev/null # && ( cd test-repo && gitk --all & )
cd ~/nashville-git/test-repo
git show-ref | awk '/\/topic/ {print $2}' | xargs -n1 -r git update-ref -d
pkill -f git-deps
