sudo tar -xzvf  /vagrant/derby-config/db-derby-10.14.2.0-bin.tar.gz    -C /usr/local 

sudo mv /usr/local/db-derby-10.14.2.0-bin /usr/local/db-derby

# 设置环境变量
sudo sh -c "echo 'export DERBY_HOME=/usr/local/db-derby' >> /etc/profile"
sudo sh -c "echo 'export PATH=$PATH:$DERBY_HOME/bin' >>  /etc/profile"
sudo sh -c "export CLASSPATH=$CLASSPATH:$DERBY_HOME/lib/derby.jar:$DERBY_HOME/lib/derbytools.jar"
# sudo echo "export HADOOP_HOME=/usr/local/hadoop" >> /etc/profile
# sudo echo "export PATH=$PATH:$HADOOP_HOME/bin" >>  /etc/profile

sudo mkdir $DERBY_HOME/data

source /etc/profile
