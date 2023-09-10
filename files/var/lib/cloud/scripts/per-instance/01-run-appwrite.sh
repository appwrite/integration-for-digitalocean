#!/bin/bash

cd /root

appversion=$(curl -s https://api.github.com/repos/appwrite/appwrite/releases/latest | grep -oP '"tag_name": "\K.*?(?=")')

echo "==============================================="
echo "=       Installing appwrite $appversion       ="
echo "==============================================="


docker run --rm \
    --volume /var/run/docker.sock:/var/run/docker.sock \
    --volume "$(pwd)"/appwrite:/usr/src/code/appwrite:rw \
    appwrite/appwrite:latest sh -c "install --httpPort=80 --httpsPort=443 --interactive=N"