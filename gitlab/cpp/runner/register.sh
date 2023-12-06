#!/bin/sh
set -e

RUNNER_TOKEN=glrt-LJs-BA4fHsyLy5gCEd5a

docker-compose exec gitlab-runner gitlab-runner register \
  --non-interactive \
  --url http://localhost \
  --token $RUNNER_TOKEN \
  --executor "shell" \

docker-compose exec -d gitlab-runner gitlab-runner run