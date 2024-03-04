FROM ubuntu-dev:latest

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update -y \
&& apt-get install -y --no-install-recommends npm nodejs \
&& rm -rf /var/lib/apt/lists/*

