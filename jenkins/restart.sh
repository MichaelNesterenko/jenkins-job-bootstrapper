#!/usr/bin/env bash

container_network="$1"

docker build -t jenkins-job-bootstrapper --progress plain .
docker run -it --rm --name jenkins-job-bootstrapper $([[ -n "$container_network" ]] && echo --network "$container_network" || echo -p 8080:8080) jenkins-job-bootstrapper