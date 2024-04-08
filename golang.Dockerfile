FROM ubuntu-dev:latest

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update -y \
&& apt-get install -y --no-install-recommends golang delve \
&& rm -rf /var/lib/apt/lists/*

RUN go install golang.org/x/tools/gopls@latest
RUN go install github.com/go-delve/delve/cmd/dlv@latest

ENV PATH="${PATH}:/root/go/bin"

