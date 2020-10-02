#!/bin/bash
cd $(dirname $0)
REPOSITORY=${1:-"ghcr.io/chuxel-com/microsoft/vscode/cache"}
TAG=${2:-"latest"}
docker build -t ${REPOSITORY}:${TAG} -f precache.Dockerfile .
docker push ${REPOSITORY}:${TAG}
