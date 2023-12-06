#!/bin/sh
set -e

RUNNER_TOKEN=glrt-VnxW69VNfv4G8sQXJCsM

docker-compose exec gitlab-runner gitlab-runner register \
  --non-interactive \
  --url http://localhost \
  --token $RUNNER_TOKEN \
  --executor "shell" \

docker-compose exec -d gitlab-runner gitlab-runner run