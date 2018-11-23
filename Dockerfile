FROM centos7.5.1804 

## Image metadata ##

LABEL maintainer="stuart@stuartellis.name" \
    version="0.2.0" \
    description="DevOps Tools"

# Enable EPEL
RUN yum -y install https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm   

# Update system
RUN yum -y update

# Add extra RPM packages
RUN yum install -y python2-pip-8.1.2-6 neovim-0.3.0-2

# Add other software
RUN pip install 'awscli==1.16.60'
