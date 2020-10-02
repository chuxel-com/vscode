#!/bin/bash
set -e

SOURCE_FOLDER="$(cd "${1:-"."}" && pwd)"
CACHE_FOLDER="${2:-"/usr/local/etc/devcontainer-cache"}"

echo "[$(date)] Starting restore operation"

if [ ! -d "${CACHE_FOLDER}" ]; then
	echo "No cache folder found."
	exit 0

fi

echo "Restoring data in ${CACHE_FOLDER} to ${SOURCE_FOLDER}..."

cd "${CACHE_FOLDER}"
tar cf - "." | (cd "${SOURCE_FOLDER}" && tar xvf -) > /dev/null

echo "[$(date)] Restore complete"



