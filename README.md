# DevOps Tools Container

[![Stability: Experimental](https://masterminds.github.io/stability/experimental.svg)](https://masterminds.github.io/stability/experimental.html)

This provides a Linux shell with tools for DevOps, using Docker.

The _share_ directory that is created will be available inside the Linux shell as _/mnt/share_. This enables you to share files between the Linux shell and your host system.

The _.aws_ directory in your user account is shared, so that the AWS CLI in the Linux shell automatically uses your settings.

Similarly, the _.ssh_ directory in your user account is shared. The Linux shell runs an SSH agent, but it does _not_ share any SSH agent that you are running on the host system.

> For safety, your _.aws_ and _.ssh_ directories are read-only in the Linux shell. 

## Tools

The container operating system is CentOS 7.6, with the Bash shell. It includes:

- [AWS CLI](https://aws.amazon.com/cli/)
- Curl
- SSH
- Git
- Nano
- Vim
- Python 3.6
- [Boto3](https://aws.amazon.com/sdk-for-python/) AWS client library for Python
- The [requests](https://2.python-requests.org/en/master/) Web client library for Python

> Git and Python 3 are provided by [Software Collections](https://www.softwarecollections.org/en/).

## Usage

### Prerequisites

The host system must have:

- Docker
- A _.aws_ directory in your user account
- A _.ssh_ directory in your user account

### Using the do.sh Script

This repository includes a convenience shell script that can set up and run the Linux environment for you.

To use the script, first run this command in a Bash shell:

    ./do.sh setup

This builds a Docker image, and creates the _share_ directory.

To get the Linux command prompt:

    ./do.sh shell

### Manually 

If you choose to use the Dockerfile manually, use the commands below, replacing the variables with the correct details.

Use _docker build_ to create a container image:

    docker build "${BUILDER_DOCKERFILE_PATH}/" -t "${BUILDER_IMAGE_ID}"

Use _docker run_ to start the Linux environment:

    docker run --rm -it -w /root --mount "type=bind,source=${SHARED_DIR},destination=/mnt/share" --mount "type=bind,source=${AWS_CREDENTIALS_DIR},destination=/root/.aws,readonly" --mount "type=bind,source=${SSH_CREDENTIALS_DIR},destination=/root/.ssh,readonly" "${BUILDER_IMAGE_ID}" /bin/bash

> Remember to create the _share_ directory for the mount.