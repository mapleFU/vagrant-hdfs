# 更改
sudo sed -i 's/archive.ubuntu.com/mirrors.ustc.edu.cn/g' /etc/apt/sources.list
# 更新软件包
sudo apt-get update

# 下载 JDK, 配置环境
sudo add-apt-repository ppa:webupd8team/java -y

sudo apt-get install -y python-software-properties debconf-utils

sudo apt-get update

kill $(ps -e | grep 'apt-get' | awk '{print $1}')

sudo rm /var/lib/apt/lists/lock
sudo rm /var/cache/apt/archives/lock
sudo rm /var/lib/dpkg/lock

sudo dpkg --configure -a

echo "[Info] Install mocivy ppa"
# RUN SILENT INSTALL
# https://askubuntu.com/questions/190582/installing-java-automatically-with-silent-option install java automaticall 的时候碰到的傻屌问题

# sudo rm /var/lib/apt/lists/lock
# sudo rm /var/cache/apt/archives/lock
# sudo rm /var/lib/dpkg/lock
# sudo dpkg --configure -a

echo "oracle-java8-installer shared/accepted-oracle-license-v1-1 select true" | sudo debconf-set-selections

echo "[Info] Install oracle-java8-installer"
sudo apt-get install -y oracle-java8-installer
echo "[Info] Install oracle-java8-installer done"

echo "[Info] Install oracle-java8-set-default"
sudo apt-get install oracle-java8-set-default -y
echo "[Info] Install oracle-java8-set-default done"

# 下载 hadoop 
# sudo apt-get install -y wget

# wget https://mirrors.tuna.tsinghua.edu.cn/apache/hadoop/core/hadoop-2.9.2/hadoop-2.9.2.tar.gz
sudo tar -xzvf  /hadoop-config/hadoop-2.9.2.tar.gz    -C /usr/local 

sudo mv /usr/local/hadoop-2.9.2 /usr/local/hadoop
# mv  hadoop  hadoop

# 设置环境变量
sudo sh -c "echo 'export HADOOP_HOME=/usr/local/hadoop' >> /etc/profile"
sudo sh -c "echo 'export PATH=$PATH:/usr/local/hadoop/bin' >>  /etc/profile"
# sudo echo "export HADOOP_HOME=/usr/local/hadoop" >> /etc/profile
# sudo echo "export PATH=$PATH:$HADOOP_HOME/bin" >>  /etc/profile

source /etc/profile

# hadoop 配置 权限和对应的 group 
sudo groupadd hadoopgroup

sudo usermod -a -G hadoopgroup vagrant

sudo chgrp -R hadoopgroup /usr/local/hadoop/

sudo chmod -R 777 /usr/local/hadoop/

sudo apt-get clean

sudo dd if=/dev/zero of=/EMPTY bs=1M
sudo rm -f /EMPTY

cat /dev/null > ~/.bash_history && history -c && exit
