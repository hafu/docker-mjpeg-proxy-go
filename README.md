# mjpeg-proxy-go

This is the Dockerfile for the [mjpeg-proxy](https://github.com/vvidic/mjpeg-proxy)
written by the user [vvidic](https://github.com/vvidic).

## Sources

Sources for the **Dockerfile**:
- [GitHub](https://github.com/hafu/docker-mjpeg-proxy-go)
- [GitLab](https://gitlab.com/hafu/docker-mjpeg-proxy-go)

Sources for **mjpeg-proxy** can be found in the repository [mjpeg-proxy](https://github.com/vvidic/mjpeg-proxy)
of the user [vvidic](https://github.com/vvidic).

## Images

Images can be pulled from the following container registries:
- Docker Hub: `docker pull docker.io/hafu/mjpeg-proxy-go`
- GitHub Container Registry: `docker pull ghcr.io/hafu/mjpeg-proxy-go`
- GitLab Container Registry: `docker pull registry.gitlab.com/hafu/docker-mjpeg-proxy-go/mjpeg-proxy-go`

There only exists a `latest` image. It is rebuild once a week.

## How to use this image

### Examples

With arguments:

```shell
$ docker run -it --rm -p 8080:8080 hafu/mjpeg-proxy-go mjpeg-proxy \
-source http://source.stream.tld/stream.mjpg
```

With sources file:

```shell
$ cat sources.json
[
   {
      "Source" : "http://213.193.89.202/axis-cgi/mjpg/video.cgi",
      "Path" : "/source1"
   },
   {
      "Source" : "http://klosterplatz.selfip.info/axis-cgi/mjpg/video.cgi",
      "Path" : "/source2"
   }
]
$ docker run -it --rm -p 8080:8080 -v $(pwd)/sources.json:/srv/sources.json:ro \
hafu/mjpeg-proxy-go mjpeg-proxy -sources /srv/sources.json
```

### Help of mjpeg-proxy

```text
Usage of mjpeg-proxy:
  -bind string
        proxy bind address (default ":8080")
  -clientheader string
        request header with client address
  -maxprocs int
        limit number of CPUs used
  -password string
        source uri password
  -path string
        proxy serving path (default "/")
  -rate float
        limit output frame rate
  -sendbuffer int
        limit buffering of frames (default 4096)
  -source string
        source uri (default "http://example.com/img.mjpg")
  -sources string
        JSON configuration file to load sources from
  -stopduration duration
        follow source after last client (default 1m0s)
  -username string
        source uri username
```

## TODO
- [ ] Variables