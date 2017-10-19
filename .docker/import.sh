#!/bin/sh
NAME="docker-builder"
export PROJECT="${NAME:-$CIRCLE_PROJECT_REPONAME}"
export DESCRIPTION="Docker container with Docker, Inspec and Ruby"
export MAINTAINER="damacus"
export FILE="Dockerfile"

if ! [[ -e .docker/functions.sh ]];then
  wget -O .docker/functions.sh "https://raw.githubusercontent.com/damacus/docker-build-scripts/master/functions.sh"
fi

source ".docker/functions.sh"
