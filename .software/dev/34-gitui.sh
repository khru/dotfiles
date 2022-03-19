#!/bin/bash
source "${BASH_SOURCE%/*}/0-ensure.sh"
ensure::jq
ensure::curl
echo "+==================+"
echo "|      GITUI       |"
echo "+==================+"

REPO=extrawurst/gitui
OUTPUT_ROUTE=~/gitui-linux-musl.tar.gz
TYPE_OF_FILE=tar.gz
BIN_NAME=gitui

URL=$(curl -sL https://api.github.com/repos/${REPO}/releases/latest | jq -r '.assets[].browser_download_url' | grep ${TYPE_OF_FILE} | sort | head -n 1)

sudo curl -L "${URL}" -o ${OUTPUT_ROUTE}
sudo chmod +x ${OUTPUT_ROUTE}
tar –xf  ${OUTPUT_ROUTE}
sudo mv  ${gitui} /usr/bin/
sudo rm -rf ${OUTPUT_ROUTE}