#!/bin/bash

export path=/home/vagrant
sudo chmod 700 ${path}/.ssh
# cat /home/vagrant/.ssh/id_rsa.pub >> /home/vagrant/.ssh/authorized_keys
sudo chmod -R 600 ${path}/.ssh/authorized_keys

sudo chmod 444 ${path}/.ssh/id_rsa

echo 'Host *.*.*.*' > ${path}/.ssh/config
echo 'StrictHostKeyChecking no' >> ${path}/.ssh/config
echo 'UserKnownHostsFile /dev/null' >> ${path}/.ssh/config
chmod -R 600 ${path}/.ssh/config

# 写入 hosts
sudo sh -c "cat /vagrant/hadoop-config/hadoop-hosts >>  /etc/hosts"
