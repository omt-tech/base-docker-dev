FROM omttech/base-docker-dev:0.2.1

ENV REFRESHED_AT=2017-08-03

LABEL maintainer="trond@omt.tech"

USER root

# Install dependencies required for CircleCI
RUN \
  # Have to use testing repo to get aws-cli
  echo "http://nl.alpinelinux.org/alpine/edge/testing" >> /etc/apk/repositories && \
  apk --no-cache add \
    # CircleCI 2.0: Requires ssh binary
    openssh-client \
    # CircleCI 2.0: Dosen't current support interpolating env vars. Add bash
    # so we can use BASH_ENV to implement it.
    bash \
    # CircleCI 2.0: Need docker to build images for deployment
    docker \
    # Used to add citext before running migrations on core
    postgresql-client \
    # Used to get login information to push docker images to ECR
    aws-cli \
    # Used to parse output from aws cli
    jq \
  && \
  rm -rf /var/cache/apk/*

USER default

WORKDIR ${HOME}
