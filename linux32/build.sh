#!/bin/bash

# Mac OS X Build.sh

source ../settings.sh

NODE_WEBKIT="node-webkit"
NW_FILE=$1
DIST_DIR="../$DIST_DIR/linux32"

if [[ -z "$NW_FILE"  ]]
then
  echo "Missing nw package"
  exit 1
fi

[ ! -d $DIST_DIR  ] && mkdir -p $DIST_DIR

mkdir $CACHE_DIR
cat $NODE_WEBKIT/nw $NW_FILE > $CACHE_DIR/$APP_NAME
cp $NODE_WEBKIT/*.so $CACHE_DIR
cp $NODE_WEBKIT/nw.pak $CACHE_DIR
cp wrapper.sh $CACHE_DIR/run.sh
cp libudev.so.0 $CACHE_DIR/
chmod +x $CACHE_DIR/$APP_NAME
chmod +x $CACHE_DIR/run.sh
rm -rf $DIST_DIR/$APP_NAME
mv $CACHE_DIR $DIST_DIR/$APP_NAME

echo "Linux 32 Build finished -> $DIST_DIR/$APP_NAME"
