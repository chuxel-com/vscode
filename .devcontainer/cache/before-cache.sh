set -e

SOURCE_FOLDER="${1:-"."}"

cd "${SOURCE_FOLDER}"
find .  -not -path "*./.git/*" -and -not -path "./.git" > /tmp/devcontainer-cache-before.txt

