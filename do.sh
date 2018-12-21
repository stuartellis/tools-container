#!/bin/sh

# Utility script
# To avoid errors, check your changes with https://www.shellcheck.net/

set -eu

PROJECT_DIR="${PWD}"
PROJECT_NAME="$(basename "${PROJECT_DIR}")"

AWS_CREDENTIALS_DIR="${HOME}/.aws"
SSH_CREDENTIALS_DIR="${HOME}/.ssh"

BUILDER_DOCKERFILE_PATH="${PROJECT_DIR}"
BUILDER_IMAGE_VERSION=$(grep "version" <  "${BUILDER_DOCKERFILE_PATH}/Dockerfile" | grep -oe "[0-9]\+[.][0-9]\+[.][0-9]\+")
BUILDER_IMAGE_ID="${PROJECT_NAME}-builder:${BUILDER_IMAGE_VERSION}"

case $1 in
  info)
    echo "Project        | Repository name       | ${PROJECT_NAME}"
    echo "Project        | Host directory        | ${PROJECT_DIR}"
    echo "Docker builder | Current image ID      | ${BUILDER_IMAGE_ID}"
    echo "Docker builder | Current image version | ${BUILDER_IMAGE_VERSION}"
    echo "AWS            | Credentials directory | ${AWS_CREDENTIALS_DIR}"
    echo "SSH            | Credentials directory | ${SSH_CREDENTIALS_DIR}"
    ;;
  setup)
    docker build "${BUILDER_DOCKERFILE_PATH}/" -t "${BUILDER_IMAGE_ID}"
    ;;
  shell)
    docker run --rm -it --mount "type=bind,source=${PROJECT_DIR},destination=/var/local" --mount "type=bind,source=${AWS_CREDENTIALS_DIR},destination=/root/.aws,readonly" --mount "type=bind,source=${SSH_CREDENTIALS_DIR},destination=/root/.ssh,readonly" "${BUILDER_IMAGE_ID}" /bin/bash
    ;;
  *)
    echo "$1 is not a valid command"
    ;;
esac

