FROM omttech/base-docker-dev:0.2.0

ENV REFRESHED_AT=2017-08-03

LABEL maintainer="trond@omt.tech"

USER root

# Install dependencies required for CircleCI
RUN \
  apk --no-cache add \
    # CircleCI 2.0: Requires ssh binary
    openssh-client \
    # CircleCI 2.0: Dosen't current support interpolating env vars. Add bash
    # so we can use BASH_ENV to implement it.
    bash \
    # CircleCI 2.0: Need docker to build images for deployment
    docker \
  && \
  rm -rf /var/cache/apk/*

USER default

WORKDIR ${HOME}
