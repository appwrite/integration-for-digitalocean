#!/bin/bash

echo "==============================================="
echo "=          Welcome, Installing Appwrite       ="
echo "==============================================="

docker run -it --rm \
    --volume /var/run/docker.sock:/var/run/docker.sock \
    --volume "$(pwd)"/appwrite:/usr/src/code/appwrite:rw \
    --entrypoint="install" \
    appwrite/appwrite:0.7.0 --version 0.7.0

cp -f /etc/skel/.bashrc /root/.bashrc