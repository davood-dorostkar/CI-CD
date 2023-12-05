FROM ubuntu:latest

RUN echo 'deb http://ir.archive.ubuntu.com/ubuntu/ jammy main restricted universe multiverse' > /etc/apt/sources.list
RUN echo 'deb http://ir.archive.ubuntu.com/ubuntu/ jammy-updates main restricted universe multiverse' >> /etc/apt/sources.list
RUN echo 'deb http://ir.archive.ubuntu.com/ubuntu/ jammy-backports main restricted universe multiverse' >> /etc/apt/sources.list

RUN apt-get update 
RUN apt-get install -y \
    ca-certificates \
    curl \
    sudo

RUN sudo curl -L --output /usr/bin/gitlab-runner "https://gitlab-runner-downloads.s3.amazonaws.com/latest/binaries/gitlab-runner-linux-amd64"
RUN sudo chmod +x /usr/bin/gitlab-runner
RUN sudo useradd --comment 'GitLab Runner' --create-home gitlab-runner --shell /bin/bash
RUN sudo gitlab-runner install --user=gitlab-runner --working-directory=/home/gitlab-runner
RUN sudo gitlab-runner start

CMD ["sudo", "gitlab-runner", "run", "--user=gitlab-runner", "--working-directory=/etc/gitlab-runner"]
