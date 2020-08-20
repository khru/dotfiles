#!/bin/bash
function ensure::jq() {
	REQUIRED_PKG=jq
	PKG_OK=$(dpkg-query -W --showformat='${Status}\n' $REQUIRED_PKG|grep "install ok installed")
	echo "Checking for $REQUIRED_PKG: {STATUS} $PKG_OK"
	if [ "" = "$PKG_OK" ]; then
	  echo "⛔ No $REQUIRED_PKG. Setting up $REQUIRED_PKG."
	  sudo apt-get --yes install $REQUIRED_PKG 
	fi
}

function ensure::curl() {
	REQUIRED_PKG=curl
	PKG_OK=$(dpkg-query -W --showformat='${Status}\n' $REQUIRED_PKG|grep "install ok installed")
	echo "Checking for $REQUIRED_PKG: {STATUS} $PKG_OK"
	if [ "" = "$PKG_OK" ]; then
	  echo "⛔ No $REQUIRED_PKG. Setting up $REQUIRED_PKG."
	  sudo apt-get --yes install $REQUIRED_PKG 
	fi
}

function ensure::php() {
	REQUIRED_PKG=php
	PKG_OK=$(dpkg-query -W --showformat='${Status}\n' $REQUIRED_PKG|grep "install ok installed")
	echo "Checking for $REQUIRED_PKG: {STATUS} $PKG_OK"
	if [ "" = "$PKG_OK" ]; then
	  echo "⛔ No $REQUIRED_PKG. Setting up $REQUIRED_PKG."
	  source "${BASH_SOURCE%/*}/8-php.sh"
	fi
}

function ensure::composer() {
	COMPOSER_NOT_EXIST=$(which composer | grep "not found")
	echo "Checking for $REQUIRED_PKG: {STATUS} $PKG_OK"
	if [ "" = "$COMPOSER_NOT_EXIST" ]; then
	  echo "⛔ No $COMPOSER_NOT_EXIST. Setting up $COMPOSER_NOT_EXIST."
	  source "${BASH_SOURCE%/*}/10-composer.sh"
	fi
}
