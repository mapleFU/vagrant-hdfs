#!/bin/bash

echo "master initialize"
# 生成
sudo ssh-keygen -t rsa -f /home/vagrant/.ssh/id_rsa -q -P "" 
# 写入公共
sudo bash -c "cat /home/vagrant/.ssh/id_rsa.pub > /vagrant/server-config-middleware/id_rsa.pub"
sudo bash -c "cat /home/vagrant/.ssh/id_rsa > /vagrant/server-config-middleware/id_rsa"


sudo bash -c "cat /home/vagrant/.ssh/id_rsa.pub >> /home/vagrant/.ssh/authorized_keys"
__dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
# sudo bash --exec ${__dir}/publis_ssh_allow.sh

#!/bin/bash


export path=/home/vagrant

sudo chown -R vagrant ${path}/.ssh 
chmod 755 -R ${path}/.ssh

echo 'Host *.*.*.*' > ${path}/.ssh/config
echo 'StrictHostKeyChecking no' >> ${path}/.ssh/config
echo 'UserKnownHostsFile /dev/null' >> ${path}/.ssh/config

# cat /home/vagrant/.ssh/id_rsa.pub >> /home/vagrant/.ssh/authorized_keys
chmod -R 600 ${path}/.ssh/authorized_keys

chmod 600 ${path}/.ssh/id_rsa

chmod -R 600 ${path}/.ssh/config

# 写入 hosts
sudo sh -c "cat /vagrant/ssh_config/hosts >>  /etc/hosts"
