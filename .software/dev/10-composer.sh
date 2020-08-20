#!/bin/bash
source "${BASH_SOURCE%/*}/0-ensure.sh"
ensure::php
function composer::init() {
	sudo curl -s https://getcomposer.org/installer | php
	sudo mv composer.phar /usr/local/bin/composer
}
composer::init
