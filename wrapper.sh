#!/bin/sh

SMP="${SMP:-2}"
MEM="${MEM:-2G}"
OVERPROV="${OVERPROV:-1}"
# TODO: Railway recently added IPv4 support for private network, change default
# IP to 127.0.0.1 once it rolled out for everyone, and finally bump ScyllaDB
# version from 5.1.4 to the latest stable version
API_ADDR="${API_ADDR:-::}"
LISTEN_ADDR="${LISTEN_ADDR:-$API_ADDR}"

[ "$1" = "scylladb" ] && shift

#region Environment variables' default values
export SEEDS="${SEEDS:-'::'}"
export AUTH_SUPERUSER_NAME="${AUTH_SUPERUSER_NAME:-cassandra}"
export AUTH_SUPERUSER_SHA512_PASSWORD="${AUTH_SUPERUSER_SHA512_PASSWORD:-'$6$F8lPuHbSJMBziP.y$vv2dB7URHQrOq4UTNpMrKfHbN7nw6wba6dnEzSUqKKvW.hPRGz/9v1rB47uqtJoPKciIAoq/L9OYw3UxvNw.y.'}"
#endregion

if [ -e "/etc/scylla/scylla.template.yaml" ]; then
	envsubst < "/etc/scylla/scylla.template.yaml" > "/etc/scylla/scylla.yaml"
	cat "/etc/scylla/scylla.yaml"
fi

/docker-entrypoint.py \
	--authorizer=AllowAllAuthorizer \
	--smp "$SMP" \
	--memory "$MEM" \
	--overprovisioned "$OVERPROV" \
	--api-address "$API_ADDR" \
	--listen-address "$LISTEN_ADDR" \
	--broadcast-rpc-address "255.255.255.0" \
	"$@"
