ARG REPOSITORY=https://github.com/vvidic/mjpeg-proxy.git

# build the binary
FROM golang:alpine as builder
ARG REPOSITORY
RUN echo $REPOSITORY
RUN apk add --no-cache git
RUN mkdir -p /usr/src/mjpeg-proxy
WORKDIR /usr/src/mjpeg-proxy
RUN git clone $REPOSITORY . && \
    go build && \
    echo "$(git rev-parse --short HEAD) ($(git log -1 --format=%cd))" > .VERSION

FROM alpine:latest
RUN apk upgrade --available --no-cache
RUN mkdir -p /usr/local/share/mjpeg-proxy
COPY --from=builder /usr/src/mjpeg-proxy/mjpeg-proxy /usr/local/bin/mjpeg-proxy
COPY --from=builder /usr/src/mjpeg-proxy/.VERSION /usr/local/share/mjpeg-proxy/VERSION
COPY ./entrypoint.sh /
ENTRYPOINT ["/entrypoint.sh"]
CMD ["mjpeg-proxy"]
