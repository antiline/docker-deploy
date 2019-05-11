#!/bin/bash

echo "start deploy"

mkdir -p $WORK_DIR

cd $TEMP_DIR

curl -H "Authorization: token $ACCESS_TOKEN"  -H "Accept: application/vnd.github.v3+json" https://api.github.com/repos/$OWNER/$REPO/releases/latest > latest.json
TAG_NAME=`cat latest.json | jq '.tag_name' |  tr -d '"'`
DOWNLOAD_URL=`cat latest.json | jq '.tarball_url' |  tr -d '"'`
curl -o $TAG_NAME.tar.gz -J -L -H "Authorization: token $ACCESS_TOKEN" -H "Accept: application/vnd.github.v3+json" $DOWNLOAD_URL

echo "download done: $TAG_NAME"

tar -zxf $TAG_NAME.tar.gz
mv $OWNER-$REPO-*/* $WORK_DIR

rm deploy.sh $TAG_NAME.tar.gz latest.json

echo "deploy done"

cd $WORK_DIR

command="$@"
echo "execute $command"
exec $command
