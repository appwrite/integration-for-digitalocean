#!/bin/bash

echo "==============================================="
echo "=          Welcome, Installing Appwrite       ="
echo "==============================================="

docker run -it --rm \
    --volume /var/run/docker.sock:/var/run/docker.sock \
    --volume "$(pwd)"/appwrite:/install/appwrite:rw \
    -e version=0.6.2 \
    appwrite/install

cp -f /etc/skel/.bashrc /root/.bashrc