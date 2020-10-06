#!/bin/bash

# This file is used to archive off a copy of any differences in the source tree into another location
# in the image. Once the codespace is up, this will be restored into its proper location (which is
# quick and happens parallel to other startup activities)

set -e

SCRIPT_PATH="$(cd "$(dirname $0)" && pwd)"
SOURCE_FOLDER=${1:-"."}
CACHE_FOLDER=${2:-"/usr/local/etc/devcontainer-cache"}

echo "[$(date)] Starting cache operation"

cd "${SOURCE_FOLDER}"
find -L . -not -path "*/.git/*" -and -not -path "${SCRIPT_PATH}/*.manifest" -type f > "${SCRIPT_PATH}/after.manifest"
grep -Fxvf  "${SCRIPT_PATH}/before.manifest" "${SCRIPT_PATH}/after.manifest" > "${SCRIPT_PATH}/cache.manifest"
mkdir -p "${CACHE_FOLDER}"
tar -cf "${CACHE_FOLDER}/cache.tar" --totals --files-from "${SCRIPT_PATH}/cache.manifest"
du -h "${CACHE_FOLDER}/cache.tar"

echo "[$(date)] Caching complete."
