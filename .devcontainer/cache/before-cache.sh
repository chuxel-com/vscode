set -e

SCRIPT_PATH=$(cd "$(dirname $0)" && pwd)
SOURCE_FOLDER="${1:-"."}"

cd "${SOURCE_FOLDER}"
find -L . -not -path "*/.git/*" -and -not -path "${SCRIPT_PATH}/*.manifest" -type f >  "${SCRIPT_PATH}/before.manifest"

