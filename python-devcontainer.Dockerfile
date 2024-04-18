FROM ubuntu-devcontainer

RUN apt-get update -y \
  && apt-get install --no-install-recommends -y \
  python3 python3-pip

RUN rm -rf /tmp/* /var/lib/apt/lists/*
