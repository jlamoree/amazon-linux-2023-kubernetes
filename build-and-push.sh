#!/usr/bin/env bash

set -e

registry="docker.io/lamoreesoftware"
repository="amazon-linux-2023-kubernetes"
kubernetes_version="1.27"
tag="${1:-latest}"
builder="local"

docker buildx inspect "${builder}" > /dev/null 2>&1 || \
  docker buildx create --name "${builder}" --node local --platform linux/arm64,linux/amd64

docker buildx build --builder "${builder}" --platform=linux/amd64,linux/arm64 --push \
  --build-arg "KUBERNETES_VERSION=${kubernetes_version}" \
  --tag "${registry}/${repository}:${tag}" --file Dockerfile .
