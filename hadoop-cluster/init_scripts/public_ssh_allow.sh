sudo chmod 700 /home/vagrant/.ssh
# cat /home/vagrant/.ssh/id_rsa.pub >> /home/vagrant/.ssh/authorized_keys
sudo chmod -R 600 /home/vagrant/.ssh/authorized_keys

sudo chmod 444 /home/vagrant/.ssh/id_rsa

echo 'Host 192.168.*.*' >> /home/vagrant/.ssh/config
echo 'StrictHostKeyChecking no' >> /home/vagrant/.ssh/config
echo 'UserKnownHostsFile /dev/null' >> /home/vagrant/.ssh/config
chmod -R 600 /home/vagrant/.ssh/config

# 写入 hosts
sudo sh -c "cat /vagrant/hadoop-config/hadoop-hosts >>  /etc/hosts"