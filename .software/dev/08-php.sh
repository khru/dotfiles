#!/bin/bash
source "${BASH_SOURCE%/*}/0-ensure.sh"
ensure::jq
ensure::curl
function php::init() {

	echo "+==================+"
	echo "|      🐘 PHP     |"
	echo "+==================+"
	PREFIX=php
	PHP_VERSION=$(curl -sL https://www.php.net/releases/?json | jq -r '.[].version' | sort -r | head -n 1 | sed 's/\.[^.]*$//')
	echo "🐘 The latest version of PHP could be: ${PHP_VERSION}" 
	IS_INSTALLEABLE=$(apt-cache search --names-only ${PREFIX}${PHP_VERSION})
	if [ ! -z "$IS_INSTALLEABLE" ]
	then
		echo "🥳 The PHP version ${PHP_VERSION} EXISTS"
		sudo apt-get install -y ${PREFIX}${PHP_VERSION}
		sudo apt-get install -y libapache2-mod-${PREFIX}${PHP_VERSION}
		sudo apt-get install -y ${PREFIX}${PHP_VERSION}-common
		sudo apt-get install -y ${PREFIX}${PHP_VERSION}-sqlite3
		sudo apt-get install -y ${PREFIX}${PHP_VERSION}-mysql
		sudo apt-get install -y ${PREFIX}${PHP_VERSION}-gmp
		sudo apt-get install -y ${PREFIX}${PHP_VERSION}-curl
		sudo apt-get install -y ${PREFIX}${PHP_VERSION}-intl
		sudo apt-get install -y ${PREFIX}${PHP_VERSION}-mbstring
		sudo apt-get install -y ${PREFIX}${PHP_VERSION}-xmlrpc
		sudo apt-get install -y ${PREFIX}${PHP_VERSION}-soap
		sudo apt-get install -y ${PREFIX}${PHP_VERSION}-ldap
		sudo apt-get install -y ${PREFIX}${PHP_VERSION}-gd
		sudo apt-get install -y ${PREFIX}${PHP_VERSION}-bcmath
		sudo apt-get install -y ${PREFIX}${PHP_VERSION}-xml
		sudo apt-get install -y ${PREFIX}${PHP_VERSION}-cli
		sudo apt-get install -y ${PREFIX}${PHP_VERSION}-zip
		sudo apt-get install -y ${PREFIX}
	else
		echo "😭 The PHP version ${PHP_VERSION} NOT EXISTS. Installing default PHP version"
	    sudo apt-get install -y ${PREFIX}
		sudo apt-get install -y libapache2-mod-${PREFIX}
		sudo apt-get install -y ${PREFIX}-common
		sudo apt-get install -y ${PREFIX}-sqlite3
		sudo apt-get install -y ${PREFIX}-mysql
		sudo apt-get install -y ${PREFIX}-gmp
		sudo apt-get install -y ${PREFIX}-curl
		sudo apt-get install -y ${PREFIX}-intl
		sudo apt-get install -y ${PREFIX}-mbstring
		sudo apt-get install -y ${PREFIX}-xmlrpc
		sudo apt-get install -y ${PREFIX}-soap
		sudo apt-get install -y ${PREFIX}-ldap
		sudo apt-get install -y ${PREFIX}-gd
		sudo apt-get install -y ${PREFIX}-bcmath
		sudo apt-get install -y ${PREFIX}-xml
		sudo apt-get install -y ${PREFIX}-cli
		sudo apt-get install -y ${PREFIX}-zip
	fi

	php -v
}

php::init