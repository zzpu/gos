FROM golang:1.6.3

#author
MAINTAINER carl

#add beego and other package
ADD github.com /go/src/github.com

#build bee tool script
ADD build.sh /build.sh

RUN chmod +x /build.sh

RUN /build.sh

#add bee tool to PATH
ENV PATH $PATH:$GOPATH/bin

#add our project
ADD hello /go/src/hello

#start project script
ADD run.sh /

RUN chmod +x /run.sh

EXPOSE 8080

CMD ["/run.sh"]
