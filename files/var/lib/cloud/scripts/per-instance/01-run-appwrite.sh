#!/bin/bash

cd /root

docker run --rm \
    --volume /var/run/docker.sock:/var/run/docker.sock \
    --volume "$(pwd)"/appwrite:/usr/src/code/appwrite:rw \
    appwrite/appwrite:0.15.0 sh -c "install --httpPort=80 --httpsPort=443 --interactive=N"