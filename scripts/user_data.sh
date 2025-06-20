#!/bin/bash
set -eux

APPV="1.2.0"

apt-get update -y
apt-get install -y git curl unzip xfsprogs

# Detecta o primeiro disco adicional que não seja o root
DEVICE=$(lsblk -ndo NAME,TYPE | awk '$2=="disk"{print $1}' | grep -v -e "^nvme0n1$" -e "^xvda$" | head -n1 || true)

if [ -n "$DEVICE" ]; then
  DEVICE="/dev/$DEVICE"

  # Formata se necessário
  if ! blkid "$DEVICE"; then
    mkfs.xfs "$DEVICE"
  fi

  # Obtém UUID e configura fstab
  UUID=$(blkid -s UUID -o value "$DEVICE")
  mkdir -p /mnt/persist-data
  echo "UUID=${UUID} /mnt/persist-data xfs defaults,nofail 0 2" >> /etc/fstab
  mount -a
fi

# Prepara diretório para docker compose
mkdir -p /mnt/persist-data/redis
chown -R 999:999 /mnt/persist-data/redis

# Baixa e prepara a aplicação
mkdir -p /opt/giropops
cd /opt/giropops

curl -L -o giropops-senhas-v$APPV.zip https://github.com/jhhenriquee/devopsb-giropops-senhas/archive/refs/tags/v$APPV.zip
unzip giropops-senhas-v$APPV.zip
mv devopsb-giropops-senhas-$APPV/* .
rm -rf devopsb-giropops-senhas-$APPV giropops-senhas-v$APPV.zip

# Inicia app
docker compose up -d

