#!/bin/sh
export PROJECT="docker-builder"
export DESCRIPTION="Docker container with Docker, Inspec and Ruby"
export MAINTAINER="damacus"

if ! [[ -e .docker/functions.sh ]];then
  wget -O .docker/functions.sh "https://raw.githubusercontent.com/damacus/docker-build-scripts/remove_deps/functions.sh"
fi

source ".docker/functions.sh"
