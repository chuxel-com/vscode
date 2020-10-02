#!/bin/bash
cd $(dirname $0)
TAG=${1:-"latest"}
REPOSITORY=${2:-"ghcr.io/chuxel-com/microsoft/vscode/cache"}
docker build -t ${REPOSITORY}:${TAG} -f precache.Dockerfile .
docker push ${REPOSITORY}:${TAG}
