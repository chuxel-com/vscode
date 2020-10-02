#!/bin/bash

SCRIPT_PATH=$(dirname $0)
SOURCE_FOLDER=${1:-"."}
CACHE_FOLDER=${2:-"/usr/local/etc/devcontainer-cache"}

rm -rf "${CACHE_FOLDER}"

cd "${SOURCE_FOLDER}"
while read in; do
	rm -rf "${SOURCE_FOLDER}/$in"
done < "${SCRIPT_PATH}/cache.manifest"
