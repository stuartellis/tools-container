#!/bin/sh

# Utility script
# To avoid errors, check your changes with https://www.shellcheck.net/

set -eu

CONTAINER_DIR="${PWD}"
CONTAINER_NAME="$(basename "${CONTAINER_DIR}")"

AWS_CREDENTIALS_DIR="${HOME}/.aws"
SSH_CREDENTIALS_DIR="${HOME}/.ssh"

BUILDER_DOCKERFILE_PATH="${CONTAINER_DIR}"
BUILDER_IMAGE_VERSION=$(grep "version" <  "${BUILDER_DOCKERFILE_PATH}/Dockerfile" | grep -oe "[0-9]\+[.][0-9]\+[.][0-9]\+")
BUILDER_IMAGE_ID="${CONTAINER_NAME}-builder:${BUILDER_IMAGE_VERSION}"

case $1 in
  info)
    echo "Container      | Container name        | ${CONTAINER_NAME}"
    echo "Docker         | Current image ID      | ${BUILDER_IMAGE_ID}"
    echo "Docker         | Current image version | ${BUILDER_IMAGE_VERSION}"
    echo "AWS            | Credentials directory | ${AWS_CREDENTIALS_DIR}"
    echo "SSH            | Credentials directory | ${SSH_CREDENTIALS_DIR}"
    ;;
  setup)
    docker build "${BUILDER_DOCKERFILE_PATH}/" -t "${BUILDER_IMAGE_ID}"
    ;;
  shell)
    docker run --rm -it --mount "type=bind,source=${AWS_CREDENTIALS_DIR},destination=/root/.aws,readonly" --mount "type=bind,source=${SSH_CREDENTIALS_DIR},destination=/root/.ssh,readonly" "${BUILDER_IMAGE_ID}" /bin/bash
    ;;
  *)
    echo "$1 is not a valid command"
    ;;
esac

