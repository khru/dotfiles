#!/bin/bash
source "${BASH_SOURCE%/*}/0-ensure.sh"
ensure::composer

composer global require phpunit/phpunit
composer global require phpunit/dbunit
composer global require phing/phing
composer global require phpdocumentor/phpdocumentor
composer global require sebastian/phpcpd
composer global require phploc/phploc
composer global require phpmd/phpmd
composer global require squizlabs/php_codesniffer