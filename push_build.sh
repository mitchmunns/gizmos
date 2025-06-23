#!/bin/bash

# Full path to Unity output
SOURCE_BUILD_DIR="/c/Users/mitch/OneDrive/Desktop/Work/Unity/stim_gen_2/Build"

# Local repo-relative target
TARGET_BUILD_DIR="./"

# Clear and copy files
rm -rf "$TARGET_BUILD_DIR"
mkdir -p "$TARGET_BUILD_DIR"
cp -r "$SOURCE_BUILD_DIR"/* "$TARGET_BUILD_DIR"

COMMIT_MSG="Update build"
TARGET_BRANCH="main"

if [ "$1" != "" ]; then
  COMMIT_MSG="$1"
fi

echo "📁 Switching to branch: $TARGET_BRANCH"
git checkout $TARGET_BRANCH

echo "⬇️ Pulling latest changes..."
git pull origin $TARGET_BRANCH

echo "📦 Adding build files from $TARGET_BUILD_DIR"
git add "$TARGET_BUILD_DIR"

echo "📝 Committing with message: $COMMIT_MSG"
git commit -m "$COMMIT_MSG"

echo "🚀 Pushing to GitHub..."
git push origin $TARGET_BRANCH

echo "✅ Done!"
read -p "Press enter to exit..."