#!/bin/sh

# This is the final, robust script to update and deploy the website.
# It commits local changes first, then syncs with the remote before pushing.
# Usage: sh deploy.sh "Your update message"

# Check if a commit message was provided
if [ -z "$1" ]; then
  echo "Error: Please provide a commit message."
  echo "Usage: sh deploy.sh \"Your update message\""
  exit 1
fi

# Step 1: Stage all local changes
echo "=> Step 1/4: Staging local changes..."
git add .

# Step 2: Commit your local work first
echo "=> Step 2/4: Committing local changes..."
# Use git diff to check if there are staged changes, to avoid empty commits
if ! git diff --staged --quiet; then
  git commit -m "$1"
else
  echo "No local changes to commit."
fi

# Step 3: Pull latest changes from remote, and rebase your new commit on top
echo "=> Step 3/4: Syncing with remote repository..."
git pull --rebase origin master

# Step 4: Push the final, combined history to GitHub
echo "=> Step 4/4: Pushing to remote repository..."
git push origin master

echo "✅ Push complete! Check the GitHub Actions page for deployment status."