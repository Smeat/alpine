#!/bin/sh

DOCKER_USERNAME=$1
DOCKER_PASSWORD=$2
DOCKER_REPO=$3
ARCH=$4
VERSION=$5
DOCKER_ARCH=$6

MANIFEST_TOOL_URL=https://github.com/estesp/manifest-tool/releases/download/v0.4.0/manifest-tool-linux-amd64

wget $MANIFEST_TOOL_URL
chmod 755 ./manifest-tool-linux-amd64

docker login -u="$DOCKER_USERNAME" -p="$DOCKER_PASSWORD" && docker push $DOCKER_REPO


./manifest-tool-linux-amd64 --username="$DOCKER_USERNAME" --password="$DOCKER_PASSWORD"  push from-args --platforms linux/$DOCKER_ARCH --template $DOCKER_REPO:$ARCH-$VERSION --target $DOCKER_REPO:$VERSION
