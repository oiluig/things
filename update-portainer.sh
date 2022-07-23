#!/bin/bash

echo "[u-p] Stop container 🛑"
docker stop portainer

echo "\n[u-p] Deleting container 🗑"
docker rm portainer

echo "\n[u-p] Pulling image 🚌"
docker pull portainer/portainer-ce

echo "\n[u-p] Deploy portainer 😈"
docker run -d -p 8000:8000 -p 9000:9000 -p 9443:9443 \
    --name=portainer --restart=always \
    -v /var/run/docker.sock:/var/run/docker.sock \
    -v portainer_data:/data \
    portainer/portainer-ce

echo "\n\nUpdate completed! 🍻"