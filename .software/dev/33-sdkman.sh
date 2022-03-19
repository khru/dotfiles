#!/bin/bash
source "${BASH_SOURCE%/*}/0-ensure.sh"
ensure::curl
curl -s "https://get.sdkman.io" | bash
source "/home/evalverde/.sdkman/bin/sdkman-init.sh"

