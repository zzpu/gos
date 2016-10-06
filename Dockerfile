FROM daocloud.io/ihypo/ubuntu-ssh:12.04

MAINTAINER Fezzpu 
RUN \
 DEBIAN_FRONTEND=noninteractive apt-get update && \
 DEBIAN_FRONTEND=noninteractive apt-get -y go
ADD . $GOPATH/src/gos
RUN go get gos
RUN CGO_ENABLED=0 go install -a gos

EXPOSE 80
CMD gos