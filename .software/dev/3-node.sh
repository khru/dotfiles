#!/bin/bash
export NVM_DIR=$HOME/.nvm;
source $NVM_DIR/nvm.sh;
source "${BASH_SOURCE%/*}/0-ensure.sh"
ensure::jq
ensure::curl
echo "+==================+"
echo "|     🛠 Node      |"
echo "+==================+"

REPO=nodejs/node
LATEST_NODE_VERSION=$(curl -s https://api.github.com/repos/${REPO}/releases/latest | jq -r '.tag_name')
nvm install ${LATEST_NODE_VERSION}
nvm use ${LATEST_NODE_VERSION}