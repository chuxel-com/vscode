#!/bin/bash
cd $(dirname $0)
REPOSITORY=${1:-"ghcr.io/chuxel-com/devcontainers/code-oss"}
TAG=${2:-"latest"}
docker build -t ${REPOSITORY}:${TAG} -f base.Dockerfile .
docker push ${REPOSITORY}:${TAG}

