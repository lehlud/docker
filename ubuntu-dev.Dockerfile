FROM ubuntu:latest

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update -y \
&& apt-get install --no-install-recommends -y \
software-properties-common gpg-agent ssh git make fish tmux curl tree ranger file default-jre-headless python3 pip plantuml graphviz man

RUN add-apt-repository ppa:maveonair/helix-editor \
&& apt-get update -y \
&& apt-get install --no-install-recommends -y helix

WORKDIR /root

COPY .ssh/id_rsa* .ssh/
COPY .gitconfig .
COPY .config/helix/ .config/helix/
COPY .config/fish/ .config/fish/
COPY .config/tmux/ .config/tmux/

RUN git config --global gpg.format ssh && git config --global user.signingkey .ssh/id_rsa.pub

ENV TERM=xterm-256color
ENV COLORTERM=truecolor
RUN chsh -s "/usr/bin/fish"
ENTRYPOINT "/usr/bin/fish"

RUN rm -rf /tmp/* /var/lib/apt/lists/*

