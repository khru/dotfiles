#!/bin/bash
sudo add-apt-repository -y ppa:hluk/copyq
sudo add-apt-repository -y ppa:inkscape.dev/stable
sudo add-apt-repository -y ppa:kritalime/ppa
sudo add-apt-repository -y ppa:peek-developers/stable
sudo apt-get remove docker docker.io
sudo apt-get update -y
sudo apt-get upgrade
