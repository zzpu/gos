FROM daocloud.io/ubuntu:14.04

MAINTAINER Fezzpu 
#RUN git clone https://github.com/zzpu/gos.git && rm -f /etc/apt/sources.list && cp gos/sources.list /etc/apt/
RUN rm /var/lib/apt/lists/* -vf && apt-get update
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y golang
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y git
RUN mkdir -p /opt/workspace 
ENV GOPATH /opt/workspace
RUN go get github.com/zzpu/gos
#ADD . $GOPATH/src/gos
RUN CGO_ENABLED=0 go install -a github.com/zzpu/gos

EXPOSE 80
CMD gos