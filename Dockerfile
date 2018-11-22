FROM amazonlinux:2.0.20181010

## Image metadata ##

LABEL maintainer="stuart@stuartellis.name" \
    version="0.1.0" \
    description="DevOps Tools"

RUN yum -y update

