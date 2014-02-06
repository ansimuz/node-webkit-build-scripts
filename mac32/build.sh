#!/bin/bash

# Mac OS X Build.sh

source ../settings.sh

NODE_WEBKIT="node-webkit.app"
NW_FILE=$1
DIST_DIR="../$DIST_DIR/mac"

if [[ -z "$NW_FILE"  ]]
then
  echo "Missing nw package"
  exit 1
fi

[ ! -d $DIST_DIR  ] && mkdir -p $DIST_DIR

cp -rf $NODE_WEBKIT $CACHE_DIR
unzip -o $NW_FILE -d $CACHE_DIR/Contents/Resources/app.nw
cp nw.icns $CACHE_DIR/Contents/Resources/nw.icns
rm -rf $DIST_DIR/$APP_NAME.app
mv $CACHE_DIR $DIST_DIR/$APP_NAME.app

echo "Mac OS X Build finished -> $DIST_DIR/$APP_NAME.app"
