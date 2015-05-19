# Version 0.0.1
FROM uwinart/base:latest

MAINTAINER Yurii Khmelevskii <y@uwinart.com>

# Set noninteractive mode for apt-get
ENV DEBIAN_FRONTEND noninteractive

RUN cd ~ && \
  wget http://tarantool.org/dist/public.key && \
  apt-key add ./public.key && \
  release=`lsb_release -c -s` && \
  echo "deb http://tarantool.org/dist/master/debian/ $release main" | \
  tee -a /etc/apt/sources.list.d/tarantool.list && \
  echo "deb-src http://tarantool.org/dist/master/debian/ $release main" | \
  tee -a /etc/apt/sources.list.d/tarantool.list && \
  apt-get update -q && \
  apt-get install -yq tarantool luarocks && \
  apt-get clean
