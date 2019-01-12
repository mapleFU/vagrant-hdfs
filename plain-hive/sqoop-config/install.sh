echo "config sqoop"

sudo tar -xzvf  /vagrant/sqoop-config/sqoop-1.4.7.bin__hadoop-2.6.0.tar.gz    -C /usr/local 

sudo mv /usr/local/sqoop-1.4.7.bin__hadoop-2.6.0 /usr/local/sqoop

sudo bash -c "cp -ar /vagrant/sqoop-config/sqoop-env.sh /usr/local/sqoop/conf"

# 好像一下子没法加入
sudo bash -c "cp -ar /vagrant/sqoop-config/mysql-connector-java-6.0.6.jar /usr/local/sqoop/server/lib"
sudo bash -c "cp -ar /vagrant/sqoop-config/mysql-connector-java-6.0.6.jar /usr/local/sqoop/lib"
sudo bash -c "cp -ar /vagrant/sqoop-config/mysql-connector-java-8.0.13.jar /usr/local/sqoop/lib"

# 设置环境变量
sudo sh -c "echo 'export SQOOP_HOME=/usr/local/sqoop' >> /etc/profile"
sudo sh -c "echo 'export PATH=$PATH:$SQOOP_HOME/bin' >>  /etc/profile"
# sudo echo "export HADOOP_HOME=/usr/local/hadoop" >> /etc/profile
# sudo echo "export PATH=$PATH:$HADOOP_HOME/bin" >>  /etc/profile

source /etc/profile

# set authority

sudo chgrp -R hadoopgroup /usr/local/sqoop/

sudo chmod -R 777 /usr/local/sqoop/

