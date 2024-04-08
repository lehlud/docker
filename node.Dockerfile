FROM ubuntu-dev:latest

ENV DEBIAN_FRONTEND=noninteractive

RUN curl -s https://deb.nodesource.com/setup_20.x | bash

RUN apt-get update -y \
&& apt-get install -y --no-install-recommends nodejs \
&& rm -rf /var/lib/apt/lists/*

RUN npm install -g typescript typescript-language-server svelte-language-server

RUN curl https://bun.sh/install | bash

