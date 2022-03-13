# Integration for Digitalocean

This repository is an Appwrite integration for Digitalocean marketplace 1-click app.

## Building

This uses [packer](packer.io) to build and create an snapshot. Following command will create a new snapshot with Appwrite 0.6.2 installation configured to run when user logs in in the image.

```shell
export DIGITALOCEAN_TOKEN='<your digitalocean access token>'

packer build appwrite.json
```

## Upgrading to New Version and Building an Image

- Make the changes to update to the new version, these files should be changed
    1. in `scripts/02-setup-appwrite-scripts.sh` update docker pull commands to pull the images required for the version you are upgrading for
    2. in `files/var/lib/cloud/scripts/per-instance/01-run-appwrite.sh` update docker command with appwrite version for `appwrite/appwrite` image.
    3. update `scripts/90-cleanup.sh` and `scripts/99-image_check.sh` scripts if new changes to [https://github.com/digitalocean/marketplace-partners/tree/master/scripts](https://github.com/digitalocean/marketplace-partners/tree/master/scripts)
    4. update `appwrite.json`, `image_name` parameter with appropriate version to recognize the snapshot easily
- Push the changes in a new branch and create a PR
- Once reviewed and merged, release a new version and tag
- Releasing new tag will execute `.travis.yml` deploy command, which will create a new snapshot in Appwrite Labs in DigitalOcean account

## Deploying to DigitalOcean Marketplace

- Go to [https://cloud.digitalocean.com/images/snapshots/droplets](https://cloud.digitalocean.com/images/snapshots/droplets). You must be using Appwrite Labs account.
- Click on the More button on the appropriate snapshot in the list
- Click on **Update a 1-Click App` and you should be redirected to the appropriate page for updating the Appwrite marketplace image
- Update the details for the new version if any changes required and submit the app for marketplace review