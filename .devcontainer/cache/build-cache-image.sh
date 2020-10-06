#!/bin/bash

# This file simply wraps the dockeer build command used to build the image with the
# cached result of the commands from "prepare.sh" and pushes it to the specified
# container image registry.

set -e

SCRIPT_PATH=$(cd "$(dirname $0)" && pwd)
TAG=${1:-"latest"}
REPOSITORY=${2:-"ghcr.io/chuxel-com/microsoft/vscode/cache"}

cd "${SCRIPT_PATH}/../.."
docker build -t ${REPOSITORY}:${TAG} -f "${SCRIPT_PATH}/cache/cache.Dockerfile" .
docker push ${REPOSITORY}:${TAG}
