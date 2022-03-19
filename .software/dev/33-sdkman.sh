#!/bin/bash
source "${BASH_SOURCE%/*}/0-ensure.sh"
ensure::curl
curl -s "https://get.sdkman.io" | bash
source "/home/evalverde/.sdkman/bin/sdkman-init.sh"
sdk install java 11.0.14-ms
sdk install kotlin