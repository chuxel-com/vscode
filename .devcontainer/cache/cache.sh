#!/bin/bash

SCRIPT_PATH=$(dirname $0)
SOURCE_FOLDER=${1:-"."}
PRECACHE_FOLDER=${2:-"/usr/local/etc/devcontainer-cache"}

mkdir -p "${PRECACHE_FOLDER}"
cp -f "${SCRIPT_PATH}/precache.manifest" "${PRECACHE_FOLDER}"

echo "Cache folder: ${PRECACHE_FOLDER}"
cd "${SOURCE_FOLDER}"
while read in; do
	TARGET_PATH="$(dirname $in)"
	echo "Caching $(basename $in) from ${TARGET_PATH}..."
	FULL_TARGET_PATH="${PRECACHE_FOLDER}/${TARGET_PATH}"
	mkdir -p "${FULL_TARGET_PATH}"
	cp -f -p -R "$in" "${FULL_TARGET_PATH}"
done < "${PRECACHE_FOLDER}/cache.manifest"
