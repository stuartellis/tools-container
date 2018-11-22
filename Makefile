.PHONY: build shell help

default: help

help:
			@echo "make shell   - Run shell with Docker"
			@echo "make help    - Display this message"

build:
			docker build -t tools-container .

shell:			docker run --rm -it --mount "type=bind,source=${PWD},destination=/var/local" --mount "type=bind,source=${HOME}/.aws,destination=/root/.aws,readonly" tools-container /bin/bash

