# Demo script
#
# Optionally use http://doitlive.readthedocs.io/en/stable/
# to make the demo more bulletproof.  Run via:
#
#   doitlive play SCRIPT.sh

#doitlive shell: /bin/bash
#doitlive prompt: smiley
#doitlive commentecho: false
#doitlive alias: c="clear"

cd ~/OpenStack/git/cinder

git tag to-backport 46b8da35
git checkout -t origin/stable/pike
################################################################
## Try the naive approach
git cherry-pick to-backport
git cherry-pick --abort

################################################################
## git-deps backporting demo
c
git deps -h
c

git deps -e origin/stable/pike to-backport^!
git deps -e origin/stable/pike -l to-backport^!

git deps -s -e origin/stable/pike

git cherry-pick d9af50b131fedfdf960eecff9093dfeadd6763af
git cherry-pick f36fc239804fb8fbf57d9df0320e2cb6d315ea10
git cherry-pick to-backport

c
cat deps.txt
git reset --hard origin/stable/pike
tsort deps.txt | tac | xargs -t git cherry-pick

################################################################
## git-explode
c
git explode -h
c
git explode file-b master

# Delete the new topic branches
git show-ref G /topic A2 X1r git update-ref -d
