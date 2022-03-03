#!/bin/bash
echo "==============================================="
echo "=     Installing docker and docker-compose    ="
echo "==============================================="

curl -fsSL https://get.docker.com -o get-docker.sh
sh get-docker.sh

curl -L "https://github.com/docker/compose/releases/download/v2.2.3/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose

chmod +x /usr/local/bin/docker-compose

rm get-docker.sh