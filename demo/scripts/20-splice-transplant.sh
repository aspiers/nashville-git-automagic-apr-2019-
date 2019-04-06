# Demo script
#
# Optionally use http://doitlive.readthedocs.io/en/stable/
# to make the demo more bulletproof.

#doitlive shell: /bin/bash
#doitlive prompt: smiley
#doitlive commentecho: false
#doitlive alias: c="clear"

################################################################
# git-splice removal of commits from a branch

cd ~/nashville-git
./create-repo.sh </dev/null
cd test-repo

# Remove a commit
git splice file-b-three-bar^!

ggrh @{1}  # reset

# Remove a commit range
git splice file-a-three-foo..file-a-eight-foo

ggrh @{1}

# Abort removing a commit range with conflicts
git splice file-b..file-a-eight-foo

git splice --in-progress
git splice --abort
git splice --in-progress

# Resolve conflicts when removing a commit range
git splice file-b..file-a-eight-foo
ggmt
git splice --continue

################################################################
# git-splice insertion of commits into a branch

# so that's for removing, not very exciting because rebase -i
# can already do that.
#
# But it can also splice commits into a branch as well as out of it.
# So let's add a feature branch

ggrh @{1}
bash ../create-repo.sh feature </dev/null

# Splice commit onto branch tip (same as cherry-pick)
git splice master file-c^!

ggrh @{1}

# Splice range onto branch tip (same as cherry-pick)
git splice master file-c^..feature^

ggrh @{1}

# Splice commit *into* branch
git splice master^ file-c^!

ggrh @{1}

# Splice a range *into* branch
git splice master^ file-c^..feature^

################################################################
# git-splice removal and insertion of commits from/into a branch

ggrh @{1}

git splice file-a-three-foo..file-a-eight-foo file-c^..feature^

################################################################
# git-transplant

ggrh @{1}

# transplant commit onto tip
git transplant file-a-eight-foo^! feature

ggrh @{1} && git branch -f feature feature@{1}

# transplant range onto tip
git transplant file-b-three-bar..master feature

ggrh @{1} && git branch -f feature feature@{1}

# transplant range inside branch
git transplant --after feature^ file-b-three-bar..master feature

ggrh @{1} && git branch -f feature feature@{1}

# transplant range onto new branch
git transplant --new-from=feature file-b-three-bar..master feature2

ggrh @{1} && git branch -D feature2

# transplant range inside new branch
git transplant --new-from=feature^^ file-b-three-bar..master feature2

ggrh @{1} && git branch -D feature2
