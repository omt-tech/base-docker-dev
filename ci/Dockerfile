FROM omttech/base-docker-dev:0.6.1

ENV REFRESHED_AT=2018-01-17

LABEL maintainer="trond@omt.tech"

# Install dependencies required for CircleCI
# CircleCI 2.0: Requires ssh binary. Docker is to build images and deployment
# postgresql-client is used to add citext before running migrations on core
# jq is used to parse output from aws cli
# pip3 is used to install awscli
# awscli is used to get login information to push docker images to ECR
RUN \
  apk --no-cache --update add \
    openssh-client \
    docker \
    postgresql-client \
    jq \
    python3 \
  && \
    pip3 install awscli \
  && \
  rm -rf /var/cache/apk/*

# These are set so we use the correct ~/.ssh folder when cloning the repo
USER default
WORKDIR ${HOME}
