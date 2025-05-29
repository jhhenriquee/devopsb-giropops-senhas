#!/bin/bash
set -eux

apt-get update -y
apt-get install -y git curl unzip

# Instala Docker
curl -fsSL https://get.docker.com | bash

# Cria o diretório da aplicação
mkdir -p /opt/giropops
cd /opt/giropops

# Baixa e extrai apenas a release v1.0.0 (sem terraform e scripts)
curl -L -o giropops-senhas-v1.0.0.zip https://github.com/jhhenriquee/devopsb-giropops-senhas/archive/refs/tags/v1.0.0.zip
unzip giropops-senhas-v1.0.0.zip
mv devopsb-giropops-senhas-1.0.0/* .
rm -rf devopsb-giropops-senhas-1.0.0 giropops-senhas-v1.0.0.zip

# Sobe o serviço
docker compose up -d

