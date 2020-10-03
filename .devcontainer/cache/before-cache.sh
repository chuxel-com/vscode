set -e

SCRIPT_PATH=$(dirname $0)
SOURCE_FOLDER="${1:-"."}"

cd "${SOURCE_FOLDER}"
find .  -not -path "./.git/*" > /tmp/devcontainer-cache-before.txt

