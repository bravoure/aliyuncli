FROM alpine:latest

# Install the jq tool to display the command output in the JSON format.
RUN apk add --no-cache jq

# Obtain and install Alibaba Cloud CLI.
RUN wget -O download.tgz https://aliyuncli.alicdn.com/aliyun-cli-linux-latest-amd64.tgz

RUN tar -xvzf download.tgz
RUN rm download.tgz
RUN mv aliyun /usr/local/bin/

## If you use Alpine Linux, run the following command to create a separate symbolic link to lib64 dynamic libraries.
RUN mkdir /lib64 && ln -s /lib/libc.musl-x86_64.so.1 /lib64/ld-linux-x86-64.so.2

ENTRYPOINT [ "/usr/local/bin/aliyun" ]
