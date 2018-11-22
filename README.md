# DevOps Tools Container

[![Stability: Experimental](https://masterminds.github.io/stability/experimental.svg)](https://masterminds.github.io/stability/experimental.html)

Docker project to set up a container with tools for DevOps.

## Prerequisites

The host system must have:

- Docker
- A _.aws_ directory for the user

## AWS CLI

The _.aws_ directory for the user is shared from the host to the containerwith a bind mount, so that the CLI in the VM automatically uses these settings.

