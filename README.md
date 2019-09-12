# DevOps Tools Container

[![Stability: Experimental](https://masterminds.github.io/stability/experimental.svg)](https://masterminds.github.io/stability/experimental.html)

Docker project to set up a container with tools for DevOps.

## Contents

This container provides:

- CentOS 7.6
- Python 3 from [Software Collections](https://www.softwarecollections.org/en/)
- The AWS CLI
- The [requests](https://2.python-requests.org/en/master/) Web client library for Python

## Prerequisites

The host system must have:

- Docker
- A _.aws_ directory for the user

## AWS CLI

The _.aws_ directory for the user is shared from the host to the container with a bind mount, so that the CLI in the VM automatically uses these settings.
