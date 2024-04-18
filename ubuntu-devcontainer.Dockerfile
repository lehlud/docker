FROM mcr.microsoft.com/vscode/devcontainers/base:ubuntu

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update -y \
    && apt-get install --no-install-recommends -y \
    software-properties-common gpg-agent ssh git

USER vscode
WORKDIR /home/vscode

COPY [[HOME]]/.ssh/id_rsa* .ssh/
COPY [[HOME]]/.gitconfig .
COPY [[HOME]]/.config/fish/ .config/fish/
RUN git config --global gpg.format ssh && git config --global user.signingkey .ssh/id_rsa.pub

USER root
WORKDIR /

RUN rm -rf /tmp/* /var/lib/apt/lists/*
