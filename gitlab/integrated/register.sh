#!/bin/sh
set -e

RUNNER_TOKEN=glrt-AZdyapD47A6VosRQx3tf

docker-compose exec gitlab-runner gitlab-runner register \
  --non-interactive \
  --url http://localhost \
  --token $RUNNER_TOKEN \
  --executor shell \

docker-compose exec -d gitlab-runner gitlab-runner run