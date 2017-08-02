FROM bitwalker/alpine-elixir:1.4.5

ENV REFRESHED_AT=2017-08-02

LABEL maintainer="trond@omt.tech"

# Install Node and NPM
RUN \
  mkdir -p /app && \
  chown -R default:0 /app && \

  apk update && \
  apk --no-cache --update add \
    # CircleCI 2.0 requires ssh binary
    openssh-client \
    # CircleCI 2.0 dosen't current support interpolating env vars. Add bash
    # so we can use BASH_ENV to implement it.
    bash \
    git \
    # For compilation
    make \
    g++ \
    # Ranch doesn't like alpine's grep -E
    grep \
    # Used to add citext before running migrations on core
    postgresql-client \
    nodejs \
    yarn \
    # For live reload
    inotify-tools \
  && \
  update-ca-certificates --fresh && \
  rm -rf /var/cache/apk/*

RUN \
  mix local.hex --force && \
  mix local.rebar --force

ENV PATH=./node_modules/.bin:$PATH

USER default

WORKDIR ${HOME}
