#!/bin/bash

#doitlive shell: /bin/bash
#doitlive prompt: smiley
#doitlive commentecho: false
#doitlive alias: c="clear"

git explode -h
c
cd ~/denvergit/test-repo
gitk --all &
git explode file-b master
