# GitLab

## in WSL
1. check your wsl IP address
```
ip addr show eth0 | grep -oP '(?<=inet\s)\d+(\.\d+){3}'
```

1. make a `compose.yaml` file, replace IP address:
```yaml
version: '3.6'
services:
  gitlab-server:
    image: 'gitlab/gitlab-ce:latest'
    restart: always
    container_name: gitlab-server
    environment:
      GITLAB_OMNIBUS_CONFIG: |
        external_url '172.31.237.251'
    ports:
      - '80:80'
      - '443:443'
      - '22:22'
    volumes:
      - './gitlab/config:/etc/gitlab'
      - './gitlab/logs:/var/log/gitlab'
      - './gitlab/data:/var/opt/gitlab'
    networks:
      - gitlab-network

  gitlab-runner:
    image: gitlab/gitlab-runner:alpine
    restart: always
    container_name: gitlab-runner
    volumes:
      - ./runner:/etc/gitlab-runner
      - /var/run/docker.sock:/var/run/docker.sock
    networks:
      - gitlab-network
    depends_on:
      - gitlab-server

networks:
  gitlab-network:
    driver: bridge
```
3. restart docker service in wsl:
```
sudo service docker restart
```
4. run compose:
```
docker-compose up --build -d
```
5. go into the gitlab server UI:
```
http://localhost
```
6. make a runner and copy its token
7. insert token and IP in the register command, and execute it:
```
#!/bin/sh

RUNNER_TOKEN=glrt-XXXXXXXXXXXXXX

docker run --rm \
  -v ./runner:/etc/gitlab-runner gitlab/gitlab-runner:alpine register \
  --non-interactive \
  --url "http://172.31.237.251" \
  --token "$RUNNER_TOKEN" \
  --executor "docker" \
  --docker-image alpine:3.16.3 \
  --description "docker-runner"
```
8. run the runner:
```
docker run --rm \
  -v ./runner:/etc/gitlab-runner gitlab/gitlab-runner:alpine run
```
## Running Server and Runner Separately
1. set a complicated password (more than 8 chars, upper and lower case, number and signs, and not an obvious pass), otherwise you cannot enter gitlab.

2. create `compose.yaml` for server and run it:
```
docker-compose up --build -d
```
3. make a project, like this:
4. turn off shared runners
4. make a runner, like this:
5. copy your token (don't use predefined `registeration token`; it is deprecated)
6. create a `compose.yaml` for runner and run it:
7. register with your token, change the URL as needed:
```
docker-compose exec gitlab-runner gitlab-runner register --url <http://localhost>  --token <glrt-Us9MEKYq22sPhgSWkSZ->
```
8. run the runner:
```
docker-compose exec -d gitlab-runner gitlab-runner run
```
9. select `shell` as executer
10. go back to gitlab UI and check if runner is active
11. create your pipeline