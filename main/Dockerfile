FROM bitwalker/alpine-elixir:1.5.3

ENV REFRESHED_AT=2018-01-17

LABEL maintainer="trond@omt.tech"

# TODO: Remove the sed once bitwalker's alpine-erlang repo is updated

# Install Node and NPM
# edge/testing is added for aws-cli and wkhtmltopdf
# make and g++ is for compilation of native modules for Elixir (and possibly node)
# grep is added because Ranch doesn't like alpine's grep -E
# bash is added because Distillery requires it
# inotify-tools is added for live reload
# wkhtmltopdf is used by several of our projects
RUN \
  mkdir -p /app && \
  chown -R default:0 /app && \
  sed -i 's/v3.6/v3.7/g' /etc/apk/repositories && \
  echo "@edgetesting http://nl.alpinelinux.org/alpine/edge/testing" >> /etc/apk/repositories && \
  apk --no-cache --update --purge upgrade && \
  apk --no-cache --update add \
    git \
    make \
    g++ \
    grep \
    bash \
    nodejs \
    yarn \
    inotify-tools \
    wkhtmltopdf@edgetesting \
  && \
  update-ca-certificates --fresh && \
  rm -rf /var/cache/apk/*

RUN \
  mix local.hex --force && \
  mix local.rebar --force

ENV PATH=./node_modules/.bin:$PATH
