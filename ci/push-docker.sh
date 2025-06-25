#!/bin/bash
set -e

# Login met lowercase gebruikersnaam
echo "$docker_password" | docker login ghcr.io --username "${docker_username,,}" --password-stdin

# Push tags met lowercase gebruikersnaam en commit hash
docker push "ghcr.io/${docker_username,,}/micronaut-app:1.0-${GIT_COMMIT,,::8}" &
docker push "ghcr.io/${docker_username,,}/micronaut-app:latest" &

wait
