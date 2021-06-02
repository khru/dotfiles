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

function ensure::docker() {
	REQUIRED_PKG=docker
	PKG_OK=$(dpkg-query -W --showformat='${Status}\n' $REQUIRED_PKG|grep "install ok installed")
	echo "Checking for $REQUIRED_PKG: {STATUS} $PKG_OK"
	if [ "" = "$PKG_OK" ]; then
	  echo "⛔ No $REQUIRED_PKG. Setting up $REQUIRED_PKG."
	  docker system prune -a || true;
	  sudo apt-get remove docker docker-engine docker.io containerd runc
	  sudo apt-get update
	  sudo apt-get install apt-transport-https ca-certificates curl gnupg-agent  software-properties-common
	  curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
	  sudo add-apt-repository \
         "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
         fossa \
         stable"
      sudo apt-get update
      DOCKER_LATEST_VERSION=$(apt-cache madison docker-ce | awk '{print $3}' | head -n 1)
      sudo apt-get install docker-ce=${DOCKER_LATEST_VERSION} docker-ce-cli=${DOCKER_LATEST_VERSION} containerd.io
      if [ ! $(grep -E "^docker:*" /etc/group) ]; then
      	sudo groupadd docker
      fi
      sudo usermod -aG docker $USER
      newgrp docker
      sudo systemctl start docker
      sudo systemctl enable docker
      sudo service docker restart
      sudo systemctl daemon-reload
      sudo apt-get install aufs-tools debootstrap docker-doc rinse zfsutils
      echo "↕️ La versión de docker es: " $(docker --version)
      echo "⚠️ 🚧 En versiones no soportadas por docker como linux mint es posible que necesites modificar el fichero\n/etc/apt/sources.list.d/additional-repositories.list\nCambiando la versiónde Linux que tengas por 'xenial', 'foca' o la última versión de ubuntu\https://stackoverflow.com/questions/41133455/docker-repository-does-not-have-a-release-file-on-running-apt-get-update-on-ubun 🚧"
	fi
}
