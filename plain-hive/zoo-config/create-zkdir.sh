#!/bin/bash


if [ -d "/home/vagrant/data/zkdata" ]; then 
    echo "/home/vagrant/data/zkdata existed"
else
    mkdir /home/vagrant/data/zkdata
fi

echo $1 > /home/vagrant/data/zkdata/myid
