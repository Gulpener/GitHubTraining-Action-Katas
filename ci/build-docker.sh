#!/bin/bash
set -e
[[ -z "${GIT_COMMIT}" ]] && Tag='local' || Tag="${GIT_COMMIT::8}" 
REPO="ghcr.io/$docker_username/"
echo "${REPO}"
LOWERCASE_REPO=$(echo "$REPO" | tr '[:upper:]' '[:lower:]')

docker build -t "${REPO}micronaut-app:latest" -t "${LOWERCASE_REPO}micronaut-app:1.0-$Tag" app/
