#!/bin/bash

echo "start deploy"


# Step 1. Clean up
rm -rf $WORK_DIR
mkdir -p $WORK_DIR

rm -rf $TEMP_DIR
mkdir -p $TEMP_DIR

cd $TEMP_DIR


# Step 2.  Check hash
HASH_URL="https://api.github.com/repos/$GITHUB_OWNER/$GITHUB_REPO/branches/master"
curl -H "Authorization: token $GITHUB_ACCESS_TOKEN" -H "Accept: application/vnd.github.v3+json" $HASH_URL > hash.txt

# Step 3. Download master
DOWNLOAD_FILE_NAME="master.tar.gz"
DOWNLOAD_URL="https://api.github.com/repos/$GITHUB_OWNER/$GITHUB_REPO/tarball"

curl -o $DOWNLOAD_FILE_NAME -J -L -H "Authorization: token $GITHUB_ACCESS_TOKEN" -H "Accept: application/vnd.github.v3+json" $DOWNLOAD_URL

echo "download done: $HASH"


# Step 4. Extract and install
tar -zxf $DOWNLOAD_FILE_NAME
mv $GITHUB_OWNER-$GITHUB_REPO-*/* $WORK_DIR
mv hash.txt $WORK_DIR

rm $DOWNLOAD_FILE_NAME

echo "deploy done"


# Step 5. Run application
cd $WORK_DIR

command="$@"
echo "execute $command"
exec $command
