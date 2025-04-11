#!/bin/sh

SMP="${SMP:-2}"
MEM="${MEM:-2G}"
OVERPROV="${OVERPROV:-1}"
API_ADDR="${API_ADDR:-::}"
LISTEN_ADDR="${LISTEN_ADDR:-::}"
RPC_ADDR="${RPC_ADDR:-127.0.0.1}"

[ "$1" = "scylladb" ] && shift

/docker-entrypoint.py \
	--smp "$SMP" \
	--memory "$MEM" \
	--overprovisioned "$OVERPROV" \
	--api-address "$API_ADDR" \
	--listen-address "$LISTEN_ADDR" \
	--rpc-address "$RPC_ADDR" \
	"$@"
