#!/bin/bash
source "${BASH_SOURCE%/*}/0-ensure.sh"
ensure::jq
ensure::curl
echo "+==================+"
echo "|   ✏️ Fira Code   |"
echo "+==================+"

REPO=tonsky/FiraCode
OUTPUT_ROUTE=~/firacode.zip
FIRECODE_FOLDER=~/firacode
DEB_FILE=$(curl -sL https://api.github.com/repos/${REPO}/releases/latest | jq -r '.assets[].browser_download_url')

sudo curl -L "${DEB_FILE}" -o ${OUTPUT_ROUTE}
sudo chmod +x ${OUTPUT_ROUTE}
[ -d "$FIRECODE_FOLDER" ] && mkdir ${FIRECODE_FOLDER}
unzip ${OUTPUT_ROUTE} -d ${FIRECODE_FOLDER}
sudo rm -rf ${OUTPUT_ROUTE}