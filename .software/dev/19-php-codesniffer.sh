#!/bin/bash
source "${BASH_SOURCE%/*}/0-ensure.sh"
ensure::composer
composer global require "squizlabs/php_codesniffer=*"