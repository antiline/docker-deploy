#!/bin/bash

echo "start deploy"

mkdir -p $WORK_DIR

cd $TEMP_DIR

DOWNLOAD_FILE_NAME="master.tar.gz"
DOWNLOAD_URL="https://api.github.com/repos/$GITHUB_OWNER/$GITHUB_REPO/tarball"
curl -o $DOWNLOAD_FILE_NAME -J -L -H "Authorization: token $GITHUB_ACCESS_TOKEN" -H "Accept: application/vnd.github.v3+json" $DOWNLOAD_URL

echo "download done: $TAG_NAME"

tar -zxf $DOWNLOAD_FILE_NAME
mv $GITHUB_OWNER-$GITHUB_REPO-*/* $WORK_DIR

rm deploy.sh $DOWNLOAD_FILE_NAME
echo "deploy done"

cd $WORK_DIR

command="$@"
echo "execute $command"
exec $command
