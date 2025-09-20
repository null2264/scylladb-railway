FROM scylladb/scylla:2025.2

# Railway's volume always mounted as root
USER root

# For 'envsubst'
RUN microdnf clean all
RUN microdnf --setopt=tsflags=nodocs -y update
RUN microdnf --setopt=tsflags=nodocs -y install gettext
RUN microdnf clean all

COPY wrapper.sh /usr/local/bin/wrapper.sh
COPY scylla.yaml /etc/scylla/scylla.template.yaml

RUN chmod +x /usr/local/bin/wrapper.sh

ENTRYPOINT ["/usr/local/bin/wrapper.sh"]

CMD ["scylladb"]

HEALTHCHECK CMD cqlsh -e "SHOW VERSION" || exit 1
