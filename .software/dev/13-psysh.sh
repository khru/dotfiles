#!/bin/bash
source "${BASH_SOURCE%/*}/0-ensure.sh"
ensure::composer
composer g require psy/psysh:@stable