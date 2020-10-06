#!/bin/bash

# This file simply wraps the dockeer build command used to build the image with the
# cached result of the commands from "prepare.sh" and pushes it to the specified
# container image registry.

set -e

SCRIPT_PATH="$(cd "$(dirname $0)" && pwd)"
BRANCH="${1:-"latest"}"
REPOSITORY="${2:-"ghcr.io/chuxel-com/microsoft/vscode/cache"}"
TAG="${BRANCH//\//-}"

echo "[$(date)] ${BRANCH} => ${TAG}"
cd "${SCRIPT_PATH}/../.."
echo "[$(date)] Building image..."
docker build -t ${REPOSITORY}:"${TAG}" -f "${SCRIPT_PATH}/cache/cache.Dockerfile" .
echo "[$(date)] Pushing image..."
docker push ${REPOSITORY}:"${TAG}"
echo "[$(date)] Done!"
