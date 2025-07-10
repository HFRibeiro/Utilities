#!/bin/bash

set -euo pipefail

echo "🔄 Switching to Minikube's Docker daemon..."
eval "$(minikube docker-env)"

echo "🛑 Stopping non-Kubernetes containers..."

# Get all running container IDs
ALL_CONTAINERS=$(docker ps -q)

# Filter out Kubernetes-managed containers
NON_K8S_CONTAINERS=()
for CID in $ALL_CONTAINERS; do
  if ! docker inspect "$CID" | grep -q 'io.kubernetes.container.name'; then
    NON_K8S_CONTAINERS+=("$CID")
  fi
done

# Stop non-Kubernetes containers if any
if [ "${#NON_K8S_CONTAINERS[@]}" -gt 0 ]; then
  docker stop "${NON_K8S_CONTAINERS[@]}"
else
  echo "No non-Kubernetes containers to stop."
fi

echo "🧹 Removing all stopped containers..."
docker container prune -f

echo "🧼 Removing all unused images..."
docker image prune -a -f

echo "🗑️ Removing all unused volumes..."
docker volume prune -f

echo "🧱 Removing build cache..."
docker builder prune -f

echo "📊 Available disk space after cleanup:"
df -h /

echo "✅ Cleanup complete."
