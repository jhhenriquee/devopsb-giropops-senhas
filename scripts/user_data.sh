#!/bin/bash
set -eux

APPV="1.1.0"

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
curl -L -o giropops-senhas-v$APPV.zip https://github.com/jhhenriquee/devopsb-giropops-senhas/archive/refs/tags/v$APPV.zip
unzip giropops-senhas-v$APPV.zip
mv devopsb-giropops-senhas-$APPV/* .
rm -rf devopsb-giropops-senhas-$APPV giropops-senhas-v$APPV.zip

# Sobe os containers
chown -R 999:999 /mnt/persist-data/redis
docker compose up -d

