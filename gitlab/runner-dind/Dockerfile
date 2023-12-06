FROM gitlab/gitlab-runner:alpine

RUN apk update \
    && apk --no-cache add docker \
    && apk add openrc

RUN rc-update \
    && mkdir -p /run/openrc/ \
    && touch /run/openrc/softlevel

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh
