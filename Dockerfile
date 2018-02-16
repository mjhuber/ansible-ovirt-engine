FROM alpine:latest
MAINTAINER Micah Huber <micah.huber@mailbox.org>
RUN apk update && \
    apk --no-cache add ansible py2-pip openssl sshpass curl-dev libxml2 && \
    apk --no-cache add --virtual .build-dependencies python2-dev gcc musl-dev openssl-dev py-libxml2 libxml2-dev && \
    pip install ovirt-engine-sdk-python && \
    apk del .build-dependencies && \
    rm -rf /var/cache/apk/*
CMD [ "ansible-playbook", "--version" ]
