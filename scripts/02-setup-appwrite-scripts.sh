#!/bin/bash
echo "==============================================="
echo "=             Making scripts runable          ="
echo "==============================================="

chmod +x /var/lib/cloud/scripts/per-instance/01-run-appwrite.sh /etc/update-motd.d/99-appwrite-readme

echo "==============================================="
echo "=             Pulling docker images             ="
echo "==============================================="

docker pull traefik:2.7
docker pull mariadb:10.7
docker pull redis:7.0.4-alpine
docker pull appwrite/influxdb:1.5.0
docker pull appwrite/telegraf:1.4.0


echo "==============================================="
echo "=             Setting up Swap                 ="
echo "==============================================="

fallocate -l 2G /swapfile
ls -lh /swapfile

chmod 600 /swapfile
ls -lh /swapfile

mkswap /swapfile
swapon /swapfile
swapon --show

echo '/swapfile none swap sw 0 0' | sudo tee -a /etc/fstab
