# mjpeg-proxy-go

This is the Dockerfile for the [mjpeg-proxy](https://github.com/vvidic/mjpeg-proxy) 
written by the User [vvidic](https://github.com/vvidic).

## How to use this image

### Examples

With arguments:

```
$ docker run -it --rm -p 8080:8080 hafu/mjpeg-proxy-go mjpeg-proxy \
-source http://source.stream.tld/stream.mjpg
```

With sources file:

```
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

```
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
- [ ] User
- [ ] Variables