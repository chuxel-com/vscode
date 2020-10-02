#!/bin/bash
set -e

SCRIPT_PATH=$(dirname $0)
SOURCE_FOLDER=${1:-"."}
CACHE_FOLDER=${2:-"/usr/local/etc/devcontainer-cache"}

date

mkdir -p "${CACHE_FOLDER}"
cp -f "${SCRIPT_PATH}/cache.manifest" "${CACHE_FOLDER}"

echo "Cache folder: ${CACHE_FOLDER}"
cd "${SOURCE_FOLDER}"
while read in; do
	TARGET_PATH="$(dirname $in)"
	echo "Caching $(basename $in) from ${TARGET_PATH}..."
	FULL_TARGET_PATH="${CACHE_FOLDER}/${TARGET_PATH}"
	mkdir -p "${FULL_TARGET_PATH}"
	cp -f -p -R "$in" "${FULL_TARGET_PATH}"
done < "${CACHE_FOLDER}/cache.manifest"

date
