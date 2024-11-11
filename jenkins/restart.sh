#!/usr/bin/env bash

container_network="$1"

docker build -t jenkins-job-bootstrapper --progress plain \
	$(for v in no_proxy http_proxy https_proxy HTTP_PROXY HTTPS_PROXY; do [[ -n "${!v}" ]] && echo --build-arg $v=${!v}; done) \
	--build-arg "JAVA_PROXY_OPTS=$(rgx='[^:]+://([^:]+):([0-9]+)'; if [[ "$http_proxy" =~ $rgx ]]; then java_http_proxy="-Dhttp.proxyHost=${BASH_REMATCH[1]} -Dhttp.proxyPort=${BASH_REMATCH[2]}"; fi; if [[ "$https_proxy" =~ $rgx ]]; then java_https_proxy="-Dhttps.proxyHost=${BASH_REMATCH[1]} -Dhttps.proxyPort=${BASH_REMATCH[2]}"; fi; echo "$java_http_proxy $java_https_proxy" )" . && \
docker run -it --rm --name jenkins-job-bootstrapper $([[ -n "$container_network" ]] && echo --network "$container_network" || echo -p 8080:8080) jenkins-job-bootstrapper
