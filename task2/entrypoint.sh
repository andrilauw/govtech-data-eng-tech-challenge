#!/usr/bin/env sh

docker-entrypoint.sh -c 'shared_buffers=256MB' -c 'max_connections=200'