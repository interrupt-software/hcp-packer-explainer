#!/bin/bash
set -e

export DEBIAN_FRONTEND=noninteractive
export TZ=America/Toronto

# Install necessary dependencies
sudo apt-get update
sudo apt-get -y install git docker.io unzip auditd

# Install latest version of docker compose
sudo curl -L "https://github.com/docker/compose/releases/download/1.29.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose

# Get HashiCups config
git clone https://github.com/hashicorp-demoapp/hashicups-setups
cd hashicups-setups/docker-compose-deployment
git checkout server

# Start HashiCups in background
sudo docker-compose up -d