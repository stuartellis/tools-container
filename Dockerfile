FROM centos:7.6.1810 

## Image metadata ##

LABEL org.opencontainers.image.version="0.6.0"
LABEL org.opencontainers.image.authors="Stuart Ellis <stuart@stuartellis.name>"
LABEL org.opencontainers.image.licenses="MIT"
LABEL org.opencontainers.image.title="Tools Container" \ 
  org.opencontainers.image.description="Linux shell and tools"

# Install additional CentOS packages
RUN yum install -y nano vim-enhanced

# Enable access to Software Collections 
RUN yum -y install centos-release-scl   

# Update system
RUN yum -y update && \ 
    yum clean all

# Install Git and Python from Software Collections
RUN yum -y install rh-git218 rh-python36

# Add latest versions of Python packages to Python 3 installation
RUN scl enable rh-git218 rh-python36 "pip3 install 'awscli' 'boto3' 'requests'"

# Enable Software Collections products in the shell
RUN echo "source scl_source enable rh-git218 rh-python36" > /etc/profile.d/scl_enable.sh 

# Create mount point
RUN mkdir /mnt/share

# Add Vim configuration 
COPY .vimrc /root/.vimrc