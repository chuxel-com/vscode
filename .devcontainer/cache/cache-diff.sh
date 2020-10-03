#!/bin/bash
set -e

SCRIPT_PATH=$(dirname $0)
SOURCE_FOLDER=${1:-"."}
CACHE_FOLDER=${2:-"/usr/local/etc/devcontainer-cache"}

echo "[$(date)] Starting cache operation"

cd "${SOURCE_FOLDER}"
find .  -not -path "*./.git/*" -and -not -path "./.git" -and -not -path "${SCRIPT_PATH}/*.manifest" > "${SCRIPT_PATH}/after.manifest"
grep -Fxvf  "${SCRIPT_PATH}/before.manifest" "${SCRIPT_PATH}/after.manifest"> "${SCRIPT_PATH}/cache.manifest"
mkdir -p "${CACHE_FOLDER}"
tar -chf "${CACHE_FOLDER}/cache.tar" --files-from "${SCRIPT_PATH}/cache.manifest" --totals
du -h "${CACHE_FOLDER}/cache.tar"

echo "[$(date)] Caching complete."
