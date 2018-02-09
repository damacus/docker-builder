#!/bin/bash
export DESCRIPTION='Docker container with Docker, Inspec and Ruby'

if ! [[ -e .docker/external_functions.sh ]];then
  wget -O '.docker/external_functions.sh' 'https://raw.githubusercontent.com/damacus/docker-build-scripts/master/functions.sh'
fi

source '.docker/external_functions.sh'
