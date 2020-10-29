#!/bin/bash
source "${BASH_SOURCE%/*}/0-ensure.sh"
ensure::jq
ensure::curl
echo "+==================+"
echo "|     🤞 NVM       |"
echo "+==================+"

REPO=nvm-sh/nvm
LATEST_VERSION=$(curl -s https://api.github.com/repos/${REPO}/releases/latest | jq -r '.tag_name')
echo "Latest version: $LATES_VERSION"
# IF JQ INSTALLATION FAILS
# LATEST_VERSION=$(curl -s https://api.github.com/${REPO}/compose/releases/latest | grep tag_name | awk '{ print $2 }' | sed -e 's/"//' | sed -e 's/"//' | sed -e 's/,//')
curl -o- https://raw.githubusercontent.com/${REPO}/${LATEST_VERSION}/install.sh | $SHELL
