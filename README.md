# DevOps Tools Container

[![Stability: Experimental](https://masterminds.github.io/stability/experimental.svg)](https://masterminds.github.io/stability/experimental.html)

This provides a Linux shell with tools for DevOps, using Docker.

The _.aws_ directory for your user account is shared from the host to the container with a bind mount, so that the AWS CLI in the container automatically uses these settings.

Similarly, the _.ssh_ directory for your user account is shared from the host to the container. 

## Prerequisites

The host system must have:

- Docker
- A _.aws_ directory for your user account
- A _.ssh_ directory for your user account

## Usage

First, build the Docker image. Run this command in a Bash shell:

    ./do.sh setup

To run a container and get the Linux command prompt:

    ./do.sh shell

## Contents

This container image provides:

- CentOS 7.6
- Python 3 from [Software Collections](https://www.softwarecollections.org/en/)
- The AWS CLI
- The [requests](https://2.python-requests.org/en/master/) Web client library for Python
