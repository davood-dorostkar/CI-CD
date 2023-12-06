#!/bin/sh
set -e

# Start Docker daemon
rc-service docker start

# Run GitLab Runner
gitlab-runner "$@"
