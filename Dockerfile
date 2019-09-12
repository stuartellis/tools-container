FROM centos:7.6.1810 

## Image metadata ##

LABEL org.opencontainers.image.version="0.4.0"
LABEL org.opencontainers.image.authors="Stuart Ellis <stuart@stuartellis.name>"
LABEL org.opencontainers.image.licenses="MIT"
LABEL org.opencontainers.image.title="DevOps Tools Container" \ 
  org.opencontainers.image.description="DevOps utility container"

# Enable access to Software Collections 
RUN yum -y install centos-release-scl   

# Update system
RUN yum -y update && \ 
    yum clean all

# Install and enable Git 2.18 and Python 3.6
RUN yum -y install rh-git218 rh-python36

# Add latest versions of libraries to Python 3 installation
RUN scl enable rh-git218 rh-python36 "pip3 install 'awscli' 'boto3' 'requests'"

# Enable Software Collections products
RUN echo "source scl_source enable rh-git218 rh-python36" > /etc/profile.d/scl_enable.sh 
