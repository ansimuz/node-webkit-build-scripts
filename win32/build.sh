#!/bin/bash

# Windows Build

source ../settings.sh

NODE_WEBKIT="node-webkit"
NW_FILE=$1
DIST_DIR="../$DIST_DIR/win32"

if [[ -z "$NW_FILE" ]]
then
  echo "Missing nw package"
  exit 1
fi

[ ! -d $DIST_DIR ] && mkdir -p $DIST_DIR

mkdir $CACHE_DIR
cat $NODE_WEBKIT/nw.exe $NW_FILE > $CACHE_DIR/app.exe
cp $NODE_WEBKIT/*.dll $CACHE_DIR
cp $NODE_WEBKIT/nw.pak $CACHE_DIR
mv $CACHE_DIR $DIST_DIR/$APP_NAME

echo "Windows 32 Build finished -> $DIST_DIR/$APP_NAME"
