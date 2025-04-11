#!/bin/sh

SMP="${SMP:-2}"
MEM="${MEM:-2G}"
OVERPROV="${OVERPROV:-1}"
API_ADDR="${API_ADDR:-::}"
LISTEN_ADDR="${LISTEN_ADDR:-::}"

[ "$1" = "scylladb" ] && shift

/docker-entrypoint.py \
	--authorizer=AllowAllAuthorizer \
	--smp "$SMP" \
	--memory "$MEM" \
	--overprovisioned "$OVERPROV" \
	--api-address "$API_ADDR" \
	--listen-address "$LISTEN_ADDR" \
	--broadcast-rpc-address "255.255.255.0" \
	"$@"
