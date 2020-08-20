#!/bin/bash
source "${BASH_SOURCE%/*}/0-ensure.sh"
ensure::curl
echo "+==================+"
echo "|  🕸 Kubernetes   |"
echo "+==================+"

curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo apt-key add
sudo apt-add-repository "deb http://apt.kubernetes.io/ kubernetes-xenial main"
sudo apt-get install kubeadm kubelet kubectl
sudo apt-mark hold kubeadm kubelet kubectl
kubeadm version