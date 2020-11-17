FROM golang:alpine

# Required because go requires gcc to build
RUN apk add build-base

RUN apk add inotify-tools

RUN echo $GOPATH

COPY . /debug_env

WORKDIR /debug_env

RUN go mod download

RUN go get github.com/go-delve/delve/cmd/dlv

CMD sh /debug_env/run.sh