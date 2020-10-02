#!/bin/bash
set -e

cd $(dirname $0)/../..
TAG=${1:-"latest"}
REPOSITORY=${2:-"ghcr.io/chuxel-com/microsoft/vscode/cache"}
docker build -t ${REPOSITORY}:${TAG} -f .devcontainer/cache/cache.Dockerfile .
docker push ${REPOSITORY}:${TAG}
