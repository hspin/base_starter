#!/usr/bin/env bash

DOWNLOAD_URL=$(curl -s https://api.github.com/repos/cortesi/modd/releases/latest | grep browser_download_url | grep linux64 | cut -d '"' -f 4)

echo "$DOWNLOAD_URL"

wget "$DOWNLOAD_URL"

sleep 1

DOWNLOAD_URL=$(curl -s https://api.github.com/repos/cortesi/devd/releases/latest | grep browser_download_url | grep linux64 | cut -d '"' -f 4)

echo "$DOWNLOAD_URL"

wget "$DOWNLOAD_URL"
