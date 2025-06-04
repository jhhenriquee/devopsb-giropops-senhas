#!/bin/bash
set -eux

apt-get update -y
apt-get install -y git curl unzip xfsprogs

# Instala Docker
curl -fsSL https://get.docker.com | bash

# Formata o disco se ainda não estiver formatado
DEVICE="/dev/xvdf"
if ! blkid $DEVICE; then
  mkfs.xfs $DEVICE
fi

# Obtém UUID do volume
UUID=$(blkid -s UUID -o value $DEVICE)

# Cria ponto de montagem
mkdir -p /mnt/persist-data

# Adiciona no fstab para persistência
echo "UUID=${UUID} /mnt/persist-data xfs defaults,nofail 0 2" >> /etc/fstab

# Monta o volume
mount -a

# Permite que o Docker use o volume
mkdir -p /mnt/persist-data/redis

# Cria o dir da aplicação
mkdir -p /opt/giropops
cd /opt/giropops

# Baixa e extrai apenas a release (sem terraform e scripts)
curl -L -o giropops-senhas-v1.0.0.zip https://github.com/jhhenriquee/devopsb-giropops-senhas/archive/refs/tags/v1.0.0.zip
unzip giropops-senhas-v1.0.0.zip
mv devopsb-giropops-senhas-1.0.0/* .
rm -rf devopsb-giropops-senhas-1.0.0 giropops-senhas-v1.0.0.zip

# Sobe os containers
docker compose up -d

