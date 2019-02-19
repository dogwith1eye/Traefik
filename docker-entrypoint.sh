#!/bin/sh
set -e

# replace cluster definition
sed -i "s/AWS_ECS_CLUSTER_NAME/$AWS_ECS_CLUSTER_NAME/;s/AWS_VIRTUAL_HOST/$AWS_VIRTUAL_HOST/;s/AWS_DEFAULT_REGION/$AWS_DEFAULT_REGION/" /etc/traefik/traefik.toml

# first arg is `-f` or `--some-option`
if [ "${1#-}" != "$1" ]; then
    set -- traefik "$@"
fi

# if our command is a valid Traefik subcommand, let's invoke it through Traefik instead
# (this allows for "docker run traefik version", etc)
if traefik "$1" --help 2>&1 >/dev/null | grep "help requested" > /dev/null 2>&1; then
    set -- traefik "$@"
fi

exec "$@"