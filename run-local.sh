#!/bin/bash
BUILD_FOLDER=$(pwd)
docker run --rm -it -v $BUILD_FOLDER:/build-dir --workdir=/build-dir -v /var/run/docker.sock:/var/run/docker.sock gfk-norm/builder:latest /bin/bash