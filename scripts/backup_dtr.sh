#!/bin/bash

set -e

export UCP_USERNAME=$(cat /vagrant/env/ucp_username)
export UCP_PASSWORD=$(cat /vagrant/env/ucp_password)
export UCP_IPADDR=$(cat /vagrant/env/ucp-node1-ipaddr)
export DTR_IPADDR=$(cat /vagrant/env/dtr-node1-ipaddr)
export DTR_REPLICA_ID=$(cat /vagrant/env/dtr-replica-id)
export DTR_VERSION=2.6.0

docker run --rm docker/dtr:${DTR_VERSION} backup --ucp-url https://${UCP_IPADDR} \
  --existing-replica-id ${DTR_REPLICA_ID} --ucp-username ${UCP_USERNAME} --ucp-password ${UCP_PASSWORD} \
  --ucp-insecure-tls > /vagrant/dtr_backup.tar
