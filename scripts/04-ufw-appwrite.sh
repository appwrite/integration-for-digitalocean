#!/bin/sh
ufw allow ssh
ufw allow 80
ufw allow 443

ufw --force enable