FROM ubuntu:latest

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update -y \
&& apt-get install --no-install-recommends -y software-properties-common gpg-agent git fish tmux

RUN add-apt-repository ppa:maveonair/helix-editor \
&& apt-get update -y \
&& apt-get install --no-install-recommends -y helix \
&& rm -rf /var/lib/apt/lists/*

WORKDIR /root

COPY .ssh/* .ssh/
COPY .config/helix/ .config/helix/
COPY .config/fish/ .config/fish/
COPY .tmux.conf .

ENV TERM=xterm-256color
ENV COLORTERM=truecolor
RUN chsh -s "/usr/bin/fish"
ENTRYPOINT "/usr/bin/fish"

