#!/bin/bash

# Change directory to the current git repository
cd "$(git rev-parse --show-toplevel)"

git add .

# Check if a commit message was provided as a parameter
if [ -n "$1" ]; then
    commit_message="$1"
else
    commit_message="Updated code"
fi

git commit -m "$commit_message"
git pull -u origin master

# Check if there are any merge conflicts
if [[ $(git status --porcelain | grep '^UU') ]]; then
    echo "Lol merge conflict, good luck. run this once you fix it:"
    echo "git add ."
    echo "git commit -m"
    echo "git push --ignore-submodules=all"
else
    git push -u origin master
fi
