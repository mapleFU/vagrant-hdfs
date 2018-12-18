# 下载 hadoop 
# sudo apt-get install -y wget

# wget https://mirrors.tuna.tsinghua.edu.cn/apache/hadoop/core/hadoop-2.9.2/hadoop-2.9.2.tar.gz
sudo tar -xzvf  /vagrant/zookeeper-3.4.13.tar.gz    -C /usr/local 

sudo mv /usr/local/zookeeper-3.4.13 /usr/local/zookeeper
# mv  hadoop  hadoop

# 设置环境变量
sudo sh -c "echo 'export ZOOKEEPER_HOME=/usr/local/zookeeper' >> /etc/profile"
sudo sh -c "echo 'export PATH=$PATH:/usr/local/zookeeper/conf' >>  /etc/profile"
# sudo echo "export HADOOP_HOME=/usr/local/hadoop" >> /etc/profile
# sudo echo "export PATH=$PATH:$HADOOP_HOME/bin" >>  /etc/profile

source /etc/profile

# zookeeper 配置 权限和对应的 group 
sudo chgrp -R hadoopgroup /usr/local/zookeeper/

sudo chmod -R 777 /usr/local/zookeeper/

sudo apt-get clean

sudo dd if=/dev/zero of=/EMPTY bs=1M
sudo rm -f /EMPTY

cat /dev/null > ~/.bash_history && history -c && exit
