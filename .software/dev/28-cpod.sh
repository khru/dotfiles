#!/bin/bash
source "${BASH_SOURCE%/*}/0-ensure.sh"
ensure::jq
ensure::curl
echo "+==================+"
echo "|     🎶 CPod      |"
echo "+==================+"

REPO=z-------------/CPod
OUTPUT_ROUTE=~/CPod.deb
EXTENSION=deb
DEB_FILE=$(curl -sL https://api.github.com/repos/${REPO}/releases/latest | jq -r '.assets[].browser_download_url' | grep ${EXTENSION})

sudo curl -L "${DEB_FILE}" -o ${OUTPUT_ROUTE}
sudo chmod +x ${OUTPUT_ROUTE}
sudo dpkg -i  ${OUTPUT_ROUTE}
sudo rm -rf ${OUTPUT_ROUTE}