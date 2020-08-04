#!/bin/bash

# Docker CE
sudo yum install -y git docker

export CURRENT_USER=$(whoami)
sudo usermod -aG docker ${CURRENT_USER}
unset CURRENT_USER

sudo systemctl enable docker.service
sudo systemctl daemon-reload
sudo systemctl restart docker.service

sudo yum update -y

# Last stable docker compose
sudo curl -L "https://github.com/docker/compose/releases/download/1.26.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose

# SSH Key for gitops

mkdir -p ~/.ssh && ssh-keygen  -f ~/.ssh/id_rsa -t rsa -b 4086 -N '' -P "" -C "graviteebot@pegasusio.io"

export PUB_KEY=$(cat ~/.ssh/id_rsa.pub)

echo '+++'
echo ' Now you have docker and docker-compose installed'
echo '+++'
docker version
docker-compose version
echo '+++'
echo ' You now need to add the following SSH public key to your Github user settings : '
echo '+++'
echo "${PUB_KEY}"
echo '+++'
