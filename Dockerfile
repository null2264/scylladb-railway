FROM scylladb/scylla

ARG SEEDS
ARG SMP
ARG MEM
ARG OVERPROV
ARG API_ADDR
ARG LISTEN_ADDR

ENV SEEDS=$SEEDS
ENV SMP=$SMP
ENV MEM=$MEM
ENV OVERPROV=$OVERPROV
ENV API_ADDR=$API_ADDR
ENV LISTEN_ADDR=$LISTEN_ADDR

ENTRYPOINT /docker-entrypoint.py --seeds "${SEEDS:-'::1'}" --smp "${SMP:-2}" --memory "${MEM:-'2G'}" --overprovisioned "${OVERPROV:-1}" --api-address "${API_ADDR:-'::'}" --listen-address "${LISTEN_ADDR:-'::'}" --rpc-address "${LISTEN_ADDR:-'::'}" --alternator-address "${LISTEN_ADDR:-'::'}"
