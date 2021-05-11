#!/bin/bash
echo "==============================================="
echo "=             Making scripts runable          ="
echo "==============================================="

chmod +x /var/lib/cloud/scripts/per-instance/01-run-appwrite.sh /opt/appwrite/install.sh /etc/update-motd.d/99-appwrite-readme

echo "==============================================="
echo "=             Installing Appwrite             ="
echo "==============================================="

cd /root

echo "installing appwrite at: $(pwd)/appwrite"

docker run -it --rm \
    --volume /var/run/docker.sock:/var/run/docker.sock \
    --volume "$(pwd)"/appwrite:/usr/src/code/appwrite:rw \
    --entrypoint="install" \
    appwrite/appwrite:0.8.0

cd appwrite
docker-compose down --remove
docker volume prune