FROM bitwalker/alpine-elixir:1.5.1

ENV REFRESHED_AT=2017-10-06

LABEL maintainer="trond@omt.tech"

# Install Node and NPM
RUN \
  mkdir -p /app && \
  chown -R default:0 /app && \

  # Add edge/testing for aws-cli
  echo "@edgetesting http://nl.alpinelinux.org/alpine/edge/testing" >> /etc/apk/repositories && \
  # Add edge/main for libuv
  echo "@edgemain http://nl.alpinelinux.org/alpine/edge/main" >> /etc/apk/repositories && \
  # Add edge/community for node 8.x
  echo "@edgecommunity http://nl.alpinelinux.org/alpine/edge/community" >> /etc/apk/repositories && \
  apk update && \
  apk --no-cache upgrade && \
  apk --no-cache --update add \
    git \
    # For compilation
    make \
    g++ \
    # Ranch doesn't like alpine's grep -E
    grep \
    # Distillery 1.5 needs bash now.
    bash \
    # node broke without this version in 8.6
    libuv@edgemain \
    nodejs-current@edgecommunity \
    nodejs-current-npm@edgecommunity \
    yarn@edgecommunity \
    # For live reload
    inotify-tools \
    # Used by most of our projects
    wkhtmltopdf@edgetesting \
  && \
  update-ca-certificates --fresh && \
  rm -rf /var/cache/apk/*

RUN \
  mix local.hex --force && \
  mix local.rebar --force

ENV PATH=./node_modules/.bin:$PATH
