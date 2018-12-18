#!/bin/bash

# if [ ! -f /home/vagrant/.ssh ]; then
#     echo "File not found!"
#     mkdir /home/vagrant/.ssh
# fi

echo "slave init"

sudo bash -c "cat /vagrant/server-config-middleware/id_rsa > /home/vagrant/.ssh/id_rsa"
sudo bash -c "cat /vagrant/server-config-middleware/id_rsa.pub >> /home/vagrant/.ssh/authorized_keys"

export path=/home/vagrant

chmod 755 ${path}/.ssh

export path=/home/vagrant

sudo chown -R vagrant ${path}/.ssh 
chmod 755 ${path}/.ssh

echo 'Host *.*.*.*' > ${path}/.ssh/config
echo 'StrictHostKeyChecking no' >> ${path}/.ssh/config
echo 'UserKnownHostsFile /dev/null' >> ${path}/.ssh/config

# cat /home/vagrant/.ssh/id_rsa.pub >> /home/vagrant/.ssh/authorized_keys
chmod -R 600 ${path}/.ssh/authorized_keys

chmod 600 ${path}/.ssh/id_rsa

chmod -R 600 ${path}/.ssh/config

# 写入 hosts
sudo sh -c "cat /vagrant/ssh_config/hosts >>  /etc/hosts"
