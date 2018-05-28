#!/bin/bash

echo -e "\033[0;32mPushing updates to GitHub...\033[0m"

# Add changes to git.
git add .

# Commit changes.
msg="update site data `date`"

if [ $# -eq 1 ]
then msg="$1"
fi

git commit -m "$msg"
 
# Push source and build repos.
git push

