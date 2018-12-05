# 生成
ssh-keygen -t rsa -f /home/vagrant/.ssh/id_rsa -q -P ""
# 写入公共
cat /home/vagrant/.ssh/id_rsa.pub > /vagrant/server-config-middleware/id_rsa.pub
cat /home/vagrant/.ssh/id_rsa > /vagrant/server-config-middleware/id_rsa

__dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
sudo bash --exec ${__dir}/publis_ssh_allow.sh
