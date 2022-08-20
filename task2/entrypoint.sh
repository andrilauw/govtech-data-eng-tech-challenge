#!/usr/bin/env sh

# psql -h 127.0.0.1 -U postgres

docker-entrypoint.sh -c 'shared_buffers=256MB' -c 'max_connections=200'