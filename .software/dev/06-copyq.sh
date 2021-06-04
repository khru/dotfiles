#!/bin/bash
source "${BASH_SOURCE%/*}/0-ensure.sh"
ensure::jq
ensure::curl
echo "+==================+"
echo "|     ©️ CopyQ     |"
echo "+==================+"

REPO=hluk/CopyQ
OUTPUT_ROUTE=~/copyq.deb
ARCHI=64
SYSTEM=Debian

DEB_FILE=$(curl -sL https://api.github.com/repos/${REPO}/releases/latest | jq -r '.assets[].browser_download_url' | grep ${ARCHI} | grep ${SYSTEM} | sort | head -n 1)

sudo curl -L "${DEB_FILE}" -o ${OUTPUT_ROUTE}
sudo chmod +x ${OUTPUT_ROUTE}
sudo dpkg -i  ${OUTPUT_ROUTE}
sudo rm -rf ${OUTPUT_ROUTE}