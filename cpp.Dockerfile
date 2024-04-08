FROM ubuntu-dev:latest

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update -y \
&& apt-get install -y --no-install-recommends build-essential cmake clang clangd

RUN cd /tmp && curl -kL --compressed https://boostorg.jfrog.io/artifactory/main/release/1.84.0/source/boost_1_84_0.tar.gz > boost_1_84_0.tar.gz \
&& tar xvf boost_1_84_0.tar.gz && cd boost_1_84_0 \
&& ./bootstrap.sh --prefix=/usr/local \
&& ./b2 install

RUN pip install cmake-language-server

RUN rm -rf /tmp/* /var/lib/apt/lists/*

