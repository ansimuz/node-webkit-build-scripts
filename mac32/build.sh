#!/bin/bash

# Mac OS X Build.sh

NODE_WEBKIT="node-webkit.app"
APP_NAME="myApp"
NW_FILE=$1
CACHE_DIR=".cache"
DIST_DIR="../dist"

[ ! -d $DIST_DIR  ] && mkdir $DIST_DIR

cp -rf $NODE_WEBKIT $CACHE_DIR
unzip -o $NW_FILE -d $CACHE_DIR/Contents/Resources/app.nw
rm -rf $DIST_DIR/$APP_NAME.app
mv $CACHE_DIR $DIST_DIR/$APP_NAME.app

echo "Mac OS X Build finished -> $DIST_DIR/$APP_NAME.app"
