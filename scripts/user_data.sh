#!/bin/bash
set -eux

apt-get update -y
apt-get install -y git curl
curl -fsSL https://get.docker.com | bash

git clone https://github.com/jhhenriquee/devopsb-giropops-senhas.git /opt/giropops
cd /opt/giropops
docker compose up -d
