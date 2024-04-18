FROM ubuntu-devcontainer

RUN apt-get update -y \
    && apt-get install --no-install-recommends -y \
    openjdk-21-jdk-headless kotlin maven gradle doxygen

RUN rm -rf /tmp/* /var/lib/apt/lists/*
