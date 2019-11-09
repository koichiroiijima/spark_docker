#!/bin/bash
set -ex
cd "$(dirname "$0")"

export VERSION=20191104

docker build . -t spark:${VERSION}
docker tag spark:${VERSION} spark:latest
docker tag spark:${VERSION} koichiroiijima/spark:${VERSION}
docker tag spark:${VERSION} koichiroiijima/spark:latest

docker push koichiroiijima/spark:${VERSION}
docker push koichiroiijima/spark:latest
