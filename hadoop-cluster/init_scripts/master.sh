# 生成
ssh-keygen -t rsa -f /home/vagrant/.ssh/id_rsa -q -P ""
# 写入公共
cat /home/vagrant/.ssh/id_rsa.pub > /vagrant/server-config-middleware/id_rsa.pub
cat /home/vagrant/.ssh/id_rsa > /vagrant/server-config-middleware/id_rsa

chmod 700 /home/vagrant/.ssh
cat id_rsa.pub >> /home/vagrant/.ssh/authorized_keys
chmod -R 600 /home/vagrant/.ssh/authorized_keys
echo 'Host 192.168.*.*' >> /home/vagrant/.ssh/config
echo 'StrictHostKeyChecking no' >> /home/vagrant/.ssh/config
echo 'UserKnownHostsFile /dev/null' >> /home/vagrant/.ssh/config
chmod -R 600 /home/vagrant/.ssh/config

# 写入 hosts
sudo sh -c "cat /vagrant/hadoop-config/hadoop-hosts >>  /etc/hosts"

