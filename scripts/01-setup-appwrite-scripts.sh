#!/bin/bash
echo "==============================================="
echo "=             Making scripts runable          ="
echo "==============================================="

chmod +x /opt/appwrite/install.sh /etc/update-motd.d/99-appwrite-readme

## add install.sh to .bashrc
echo "/opt/appwrite/install.sh" >> /root/.bashrc