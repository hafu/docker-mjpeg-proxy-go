# variables to get reproducible builds
ARG REPOSITORY=https://github.com/vvidic/mjpeg-proxy.git
ARG COMMIT=6920c7b
ARG VERSION=20200722

# build the binary
FROM golang:alpine as builder
RUN apk add --no-cache --virtual .fetch-deps git
RUN mkdir -p /usr/src/mjpeg-proxy
WORKDIR /usr/src/mjpeg-proxy
RUN git clone https://github.com/vvidic/mjpeg-proxy.git . && \
    git checkout $COMMIT && \
    go build


FROM alpine
COPY --from=builder /usr/src/mjpeg-proxy/mjpeg-proxy /usr/local/bin/mjpeg-proxy
COPY ./entrypoint.sh /
ENTRYPOINT ["/entrypoint.sh"]
CMD ["mjpeg-proxy"]
