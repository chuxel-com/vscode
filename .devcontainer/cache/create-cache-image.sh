#!/bin/bash
set -e

SCRIPT_PATH=$(cd dirname $0 && pwd)
TAG=${1:-"latest"}
REPOSITORY=${2:-"ghcr.io/chuxel-com/microsoft/vscode/cache"}

cd "${SCRIPT_PATH}/../.."
docker build -t ${REPOSITORY}:${TAG} -f .devcontainer/cache/cache.Dockerfile .
docker push ${REPOSITORY}:${TAG}
