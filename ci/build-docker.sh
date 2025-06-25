#!/bin/bash
set -e

# Verkrijg commit tag of standaard naar 'local'
[[ -z "${GIT_COMMIT}" ]] && Tag='local' || Tag="${GIT_COMMIT::8}"

# Zet gebruikersnaam en repo volledig in lowercase
REPO="ghcr.io/${docker_username,,}/"
echo "$REPO"

docker build \
  -t "${REPO}micronaut-app:latest" \
  -t "${REPO}micronaut-app:1.0-${Tag,,}" \
  app/
