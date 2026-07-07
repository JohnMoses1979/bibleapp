#!/bin/bash

set -e

echo "===== Pull latest code ====="
git fetch origin
git reset --hard origin/main

echo "===== Stop existing containers ====="
docker compose down

echo "===== Build and start containers ====="
docker compose up -d --build

echo "===== Remove unused images ====="
docker image prune -f

echo "===== Deployment completed ====="

docker ps

