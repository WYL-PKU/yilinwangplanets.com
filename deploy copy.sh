#!/bin/sh

# This is a script to quickly update and deploy the website.
# Usage:
# sh deploy.sh "Your update message"

# Check if a commit message was provided
if [ -z "$1" ]; then
  echo "Error: Please provide a commit message."
  echo "Usage: sh deploy.sh \"Your update message\""
  exit 1
fi

# Step 1: Add all local changes to the staging area
echo "=> Step 1/3: Staging files..."
git add .

# Step 2: Commit the changes, using the first argument as the commit message
echo "=> Step 2/3: Committing changes..."
git commit -m "$1"

# Step 3: Push to the master branch on GitHub to trigger the Action
echo "=> Step 3/3: Pushing to remote repository..."
git push origin master

echo "✅ Push complete! Check the GitHub Actions page for deployment status."