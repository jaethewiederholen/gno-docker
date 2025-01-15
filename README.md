# gno-docker

gno docker is tool for running gno.land node in docker environment.

### HOW TO RUN 
#### Prerequisite
- docker

#### Steps
1. First, init submodule gno  
( Supporting gno version : `commit 848e2a0160de95abd925d346c6e23db2a8543ab8`) 
```bash
git submodule update --init --recursive
```

2. Next, you will build gno docker image
``` bash
cd gno
docker build -t gnoland:test .

```
**🌠 Trouble Shooting**  
If you have problem with building docker image due to this error :
` tls: failed to verify certificate: x509: certificate signed by unknown authority `   
try add below code in `gno/Dockerfile` 
```
# build gno
FROM        golang:1.22-alpine AS build-gno

# ADD FROM HERE..

RUN         apk add --no-cache ca-certificates openssl

# Define the location for custom certificates
ARG         cert_location=/usr/local/share/ca-certificates

# Fetch and install certificates for github.com and proxy.golang.org
RUN         openssl s_client -showcerts -connect github.com:443 </dev/null 2>/dev/null | \
            openssl x509 -outform PEM > ${cert_location}/github.crt && \
            update-ca-certificates
RUN         openssl s_client -showcerts -connect proxy.golang.org:443 </dev/null 2>/dev/null | \
            openssl x509 -outform PEM > ${cert_location}/proxy.golang.crt && \
            update-ca-certificates
// TO HERE ..

RUN         go env -w GOMODCACHE=/root/.cache/go-build
```

3. go to main directory (gno-docker) and run ./run.sh script
4. to stop the container, simpley run ./remove.sh script
