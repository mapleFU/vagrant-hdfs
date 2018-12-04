# Vagrant-Hdfs-Cluster

Vagrant-Hdfs-Cluster is a project that using vagrant to simplify your hdfs cluster config.

In this project, we first install Java and Hadoop build a basic Vagrant box: hadoop292. Then we will use multimachine technique to build a hdfs cluster.

## Build `hadoop292`

Our first target is building a hadoop box. 

Firstly, clone the project.

`git clone https://github.com/mapleFU/vagrant-hdfs`

Then, install hadoop file in this directory and install file.

```bash
cd vagrant-hdfs

wget https://mirrors.tuna.tsinghua.edu.cn/apache/hadoop/core/hadoop-2.9.2/hadoop-2.9.2.tar.gz
```

And now you can add vagrant box for ubuntu system.

```bash
vagrant box add ubuntu/xenial64
```

Now, use `vagrant up` to set up vm, it may cost a long time.

Then, export this a box and add it  

```
vagrant package --output hadoop292.box
vagrant box add hadoop292 hadoop292.box
```



Now, you can have fun using hadoop with this box.