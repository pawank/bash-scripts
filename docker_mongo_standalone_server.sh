#!/bin/sh

MONGODB_DATA_DIR=$1
if [[ -z "$MONGODB_DATA_DIR" ]]; then
    MONGODB_DATA_DIR="/Users/pawan/databases/docker/mongodb/"
fi
IS_OSX=$2
if [[ -z "$IS_OSX" ]]; then
  echo "Using MONGODB_DATA_DIR - $MONGODB_DATA_DIR"
  docker run -d -p 27017:27017 -p 28017:28017 -v $MONGODB_DATA_DIR:/data/db --name mongodb dockerfile/mongodb mongod --rest --httpinterface
else
  echo "Using MONGODB_DATA_DIR - $MONGODB_DATA_DIR"
  docker run -v $MONGODB_DATA_DIR --name mongodb_dir busybox true
  docker run -d -p 27017:27017 -p 28017:28017 --volumes-from mongodb_dir --name mongodb dockerfile/mongodb mongod --rest --httpinterface
fi

