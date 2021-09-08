#!/bin/bash
echo "==============================================="
echo "=             Making scripts runable          ="
echo "==============================================="

chmod +x /var/lib/cloud/scripts/per-instance/01-run-appwrite.sh /etc/update-motd.d/99-appwrite-readme

echo "==============================================="
echo "=             Pulling docker images             ="
echo "==============================================="

docker pull appwrite/appwrite:0.10.2
docker pull traefik:2.5
docker pull appwrite/mariadb:1.2.0
docker pull redis:6.0-alpine3.12
docker pull appwrite/influxdb:1.0.0
docker pull appwrite/telegraf:1.2.0


echo "==============================================="
echo "=             Setting up Swap                 ="
echo "==============================================="

fallocate -l 1G /swapfile
ls -lh /swapfile

chmod 600 /swapfile
ls -lh /swapfile

mkswap /swapfile
swapon /swapfile
swapon --show

echo '/swapfile none swap sw 0 0' | sudo tee -a /etc/fstab
