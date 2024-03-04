FROM ubuntu-dev:latest

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update -y \
&& apt-get install -y --no-install-recommends build-essential clang clangd libboost-all-dev \
&& rm -rf /var/lib/apt/lists/*

