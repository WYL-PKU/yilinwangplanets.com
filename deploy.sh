#!/bin/sh

# This is an intelligent script to update and deploy the website.
# It automatically syncs with remote changes before pushing.
# Usage: sh deploy.sh "Your update message"

# Check if a commit message was provided
if [ -z "$1" ]; then
  echo "Error: Please provide a commit message."
  echo "Usage: sh deploy.sh \"Your update message\""
  exit 1
fi

# Step 1: Pull the latest changes from the remote repository
# This syncs any automated commits (like talkmap) from the GitHub Action
echo "=> Step 1/4: Syncing with remote repository..."
git pull origin master

# Step 2: Add all local changes to the staging area
echo "=> Step 2/4: Staging files..."
git add .

# Step 3: Commit the changes, using the first argument as the commit message
echo "=> Step 3/4: Committing changes..."
# Use "git commit --allow-empty" in case there are no new local changes after the pull
git commit --allow-empty -m "$1"

# Step 4: Push all commits (yours and the merged ones) to GitHub
echo "=> Step 4/4: Pushing to remote repository..."
git push origin master

echo "✅ Push complete! Check the GitHub Actions page for deployment status."