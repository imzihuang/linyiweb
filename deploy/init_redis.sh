#! /bin/sh

install_dir=/usr/local/redis/
log_dir=/var/log/redis/

if [ ! -d "$install_dir" ]; then
	sudo mkdir $install_dir
fi

if [ ! -d "$log_dir" ]; then
	sudo mkdir $log_dir
fi

python ./py/redis.py conf-template/redis_conf_template
sudo mv redis_*.conf $install_dir

cd $install_dir
for conf in redis_*.conf 
do
	sudo redis-server $conf
done
