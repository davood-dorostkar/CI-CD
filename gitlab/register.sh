#!/bin/sh
set -e

# Check the operating system
if [[ $(uname) == "Linux" ]]; then
    # Linux command
    URL=`ip addr show eno1 | grep -oP '(?<=inet\s)\d+(\.\d+){3}'`
elif [[ $(uname) == "MINGW"* ]]; then
    # Windows command
    URL=`ip addr show eth0 | grep -oP '(?<=inet\s)\d+(\.\d+){3}'`
else
    echo "Unsupported operating system"
    exit 1  # Exit with an error code
fi

RUNNER_TOKEN=glrt-kA9uzkNAt3-rZ7zziogv

echo $URL

docker-compose exec gitlab-runner gitlab-runner register \
  --non-interactive \
  --url "http://$URL" \
  --token "$RUNNER_TOKEN" \
  --executor "docker" \
  --docker-image alpine:3.16.3 \
  --description "docker-runner" \
  # --tag-list "docker" \
  # --run-untagged="true" \
  # --locked="false" \


# docker run --rm \
#   -v ./runner:/etc/gitlab-runner gitlab/gitlab-runner:alpine register \
#   --non-interactive \
#   --url "http://$URL" \
#   --token "$RUNNER_TOKEN" \
#   --executor "docker" \
#   --docker-image alpine:3.16.3 \
#   --description "docker-runner"

# docker run --rm \
#   -v ./runner:/etc/gitlab-runner gitlab/gitlab-runner:alpine register \
#   --non-interactive \
#   --url "http://localhost/" \
#   --token "$RUNNER_TOKEN" \
#   --executor "docker" \
#   --docker-image alpine:3.16.3 \
#   --description "docker-runner"


# docker run --rm \
#   -v ./runner:/etc/gitlab-runner gitlab/gitlab-runner:alpine run


