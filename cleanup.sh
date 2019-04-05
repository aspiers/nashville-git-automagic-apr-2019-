#!/bin/bash

cd ~/OpenStack/git/cinder
git checkout master
git branch -D stable/pike
git tag -d to-backport
cd ~/nashville-git/
#./create-repo.sh </dev/null # && ( cd test-repo && gitk --all & )
cd ~/nashville-git/test-repo
git show-ref | awk '/\/topic/ {print $2}' | xargs -n1 -r git update-ref -d
pkill -f git-deps
