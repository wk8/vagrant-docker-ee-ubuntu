#!/bin/bash

set -e

export UCP_IPADDR=$(cat /vagrant/env/ucp-node1-ipaddr)
export UCP_PASSWORD=$(cat /vagrant/env/ucp_password)
export UCP_ID=$(cat /vagrant/env/ucp-id)
export UCP_VERSION=3.1.0

docker container run --rm -it \
  -v /var/run/docker.sock:/var/run/docker.sock \
  --name ucp docker/ucp:${UCP_VERSION} uninstall-ucp --id ${UCP_ID}

docker container run --rm -i --name ucp \
  -v /var/run/docker.sock:/var/run/docker.sock  \
  docker/ucp:${UCP_VERSION} restore --passphrase "dockeradmin123" < /vagrant/ucp_backup.tar
