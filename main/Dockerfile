FROM bitwalker/alpine-elixir:1.6.1

ENV REFRESHED_AT=2018-02-05

LABEL maintainer="trond@omt.tech"

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
