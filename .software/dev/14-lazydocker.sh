#!/bin/bash
source "${BASH_SOURCE%/*}/0-ensure.sh"
ensure::curl
curl https://raw.githubusercontent.com/jesseduffield/lazydocker/master/scripts/install_update_linux.sh | bash
