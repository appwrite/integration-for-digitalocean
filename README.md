# Integration for Digitalocean

This repository is an Appwrite integration for Digitalocean marketplace 1-click app.

## Building
This uses [packer](packer.io) to build and create an snapshot. Following command will create a new snapshot with Appwrite 0.6.2 installation configured to run when user logs in in the image.

```shell
export DIGITALOCEAN_TOKEN='<your digitalocean access token>'

packer build appwrite.json
```