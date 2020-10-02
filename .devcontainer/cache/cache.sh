#!/bin/bash
set -e

SCRIPT_PATH=$(dirname $0)
SOURCE_FOLDER=${1:-"."}
CACHE_FOLDER=${2:-"/usr/local/etc/devcontainer-cache"}

echo "[$(date)] Starting cache operation"

CACHE_MANIFEST=$(cd ${SOURCE_FOLDER} && find -name 'node_modules' -or -name 'out' -type d | grep -vE '.*/node_modules/.*/(node_modules|out)')

mkdir -p "${CACHE_FOLDER}"
#echo "${CACHE_MANIFEST}" > "${CACHE_FOLDER}/cache.manifest"

echo "Cache folder: ${CACHE_FOLDER}"
cd "${SOURCE_FOLDER}"
echo "${CACHE_MANIFEST}" | while read FOLDER; do
	TARGET_PATH="$(dirname "${FOLDER}")"
	echo "Caching $(basename "${FOLDER}") from ${TARGET_PATH}..."
	FULL_TARGET_PATH="${CACHE_FOLDER}/${TARGET_PATH}"
	mkdir -p "${FULL_TARGET_PATH}"
	cp -f -p -R "${FOLDER}" "${FULL_TARGET_PATH}"
done

echo "[$(date)] Caching complete."
