# 生成
ssh-keygen -t rsa -f /home/vagrant/.ssh/id_rsa -q -P ""

echo /home/vagrant/.ssh/id_rsa.pub >> /vagrant/server-config-middleware/id_rsa.pub
