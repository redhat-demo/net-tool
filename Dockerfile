FROM registry.access.redhat.com/ubi8/ubi:latest
LABEL io.k8s.display-name="Network Tools" \
      io.k8s.description="Networking toolset for connectivity and performance tests" \
      io.openshift.tags="nettools"

# NOTE: Using the UBI image with some of these packages requires
# building on a RHEL node with valid subscriptions
RUN dnf install --nodocs -y \
   iproute procps-ng bind-utils iputils \
   net-tools \
   lksctp-tools \
   less jq  && \
   dnf clean all && \
   rm -rf /var/cache/dnf

ENTRYPOINT /bin/bash -c "sleep infinity"
