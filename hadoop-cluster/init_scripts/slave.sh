#!/bin/bash

cat /vagrant/server-config-middleware/id_rsa > /home/vagrant/.ssh/id_rsa
cat /vagrant/server-config-middleware/id_rsa.pub >> /home/vagrant/.ssh/authorized_keys

__dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

sudo bash --exec ${__dir}/public_ssh_allow.sh
