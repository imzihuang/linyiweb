#!/bin/sh

#安装easy_install
sudo apt-get install python-setuptools

sudo easy_install pip

sudo pip install tornado
sudo easy_install simplejson
sudo easy_install pycrypto
sudo easy_install setproctitle

#安装mysql
sudo apt-get install mysql-server
sudo apt-get install python-mysqldb


#mysql密码：linyi

#redis
source_dir=~/downloads
sudo apt-get purge redis*
cd $source_dir
tar -zxvf redis-2.8.17.tar.gz
cd redis-2.8.17
make
sudo make install

