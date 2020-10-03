set -e

SCRIPT_PATH=$(dirname $0)
SOURCE_FOLDER="${1:-"."}"

cd "${SOURCE_FOLDER}"
find .  -not -path "*./.git/*" -and -not -path "./.git" -and -not -path "${SCRIPT_PATH}/*.manifest" -type f >  "${SCRIPT_PATH}/before.manifest"

