#!/bin/bash

# This file restores the results of the "prepare.sh" into their proper locations
# once the container has been created. It runs as a postCreateCommand which
# in GitHub Codespaces occurs parallel to other startup activities and does not
# really add to the overal startup time given how quick the operation is (despite
# managing about 1.8GB of data).

set -e

SOURCE_FOLDER="$(cd "${1:-"."}" && pwd)"
CACHE_FOLDER="${2:-"/usr/local/etc/devcontainer-cache"}"

echo "[$(date)] Starting restore operation"

if [ ! -d "${CACHE_FOLDER}" ]; then
	echo "No cache folder found."
	exit 0
fi

echo "Expanding $(du -h "${CACHE_FOLDER}/cache.tar") file to ${SOURCE_FOLDER}..."

cd "${SOURCE_FOLDER}"
tar -xf "${CACHE_FOLDER}/cache.tar"
rm -f "${CACHE_FOLDER}/cache.tar"

echo "[$(date)] Restore complete"

