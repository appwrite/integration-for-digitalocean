#!/bin/bash
echo "====================================================================="
echo "=     Confirm docker is installed and appwrite images are pulled    ="
echo "====================================================================="

docker info

docker-compose -v

docker image ls