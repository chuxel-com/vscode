#!/bin/bash
set -e

SCRIPT_PATH=$(dirname $0)
SOURCE_FOLDER=${1:-"."}
CACHE_FOLDER=${2:-"/usr/local/etc/devcontainer-cache"}

echo "[$(date)] Starting cache operation"

cd "${SOURCE_FOLDER}"
find .  -not -path "./.git/*" > /tmp/devcontainer-cache-after.txt
grep -Fxvf /tmp/devcontainer-cache-before.txt /tmp/devcontainer-cache-after.txt > /tmp/devcontainer-cache.manifest
mkdir -p "${CACHE_FOLDER}"
tar -cf "${CACHE_FOLDER}/cache.tar" -t /tmp/devcontainer-cache.manifest
du -h "${CACHE_FOLDER}/cache.tar"

echo "[$(date)] Caching complete."
