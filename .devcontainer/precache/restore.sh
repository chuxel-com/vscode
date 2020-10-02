#!/bin/bash
SOURCE_FOLDER=${1:-"."}
PRECACHE_FOLDER=${2:-"/usr/local/etc/devcontainer-cache"}

if [ ! -d "${PRECACHE_FOLDER}" ]; then
	echo "No cache folder found."
	exit 0
fi

cd "${SOURCE_FOLDER}"
while read in; do
	FULL_TARGET_PATH="${SOURCE_FOLDER}/${in}"
	if [ -e "${FULL_TARGET_PATH}" ]; then
		echo "Removing existing ${FULL_TARGET_PATH}..."
		rm -rf "${FULL_TARGET_PATH}"
	fi

	TARGET_BASEPATH="$(dirname $in)"
	echo "Restoring $(basename $in) to ${TARGET_BASEPATH}..."
	FULL_TARGET_BASEPATH="${SOURCE_FOLDER}/${TARGET_BASEPATH}"
	mkdir -p "${FULL_TARGET_BASEPATH}"
	mv "${PRECACHE_FOLDER}/$in" "${FULL_TARGET_BASEPATH}"
done < "${PRECACHE_FOLDER}/precache.manifest"
