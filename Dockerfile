FROM ubuntu:latest
ARG VERSION=1.14.4
ARG OS=linux
ARG ARCH=amd64
RUN apt-get update && \
    apt-get install wget gcc -y
RUN cd /tmp
RUN wget https://golang.org/dl/go$VERSION.$OS-$ARCH.tar.gz
RUN tar -C /usr/local -xzf go$VERSION.$OS-$ARCH.tar.gz
ENV PATH=$PATH:/usr/local/go/bin:/root/go/bin
RUN rm -rf /go$VERSION.$OS-$ARCH.tar.gz
ENV GOBIN=/root/go/bin
ENV GO111MODULE=on
RUN go env
RUN echo ${PATH}
RUN go get github.com/micro/micro/v2
# RUN micro server
# ENTRYPOINT [ "micro", "server" ]