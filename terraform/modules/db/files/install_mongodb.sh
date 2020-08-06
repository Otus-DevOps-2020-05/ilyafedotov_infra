#!/bin/sh
sudo apt-get update
sudo wget -qO - https://www.mongodb.org/static/pgp/server-3.2.asc | sudo apt-key add - # После пайпа sudo не убрано - а то не отработает добавление ключа
sudo echo "deb http://repo.mongodb.org/apt/ubuntu xenial/mongodb-org/3.2 multiverse" | tee /etc/apt/sources.list.d/mongodb-org-3.2.list
sudo rm /var/lib/apt/lists/lock
sudo rm /var/cache/apt/archives/lock
sudo rm /var/lib/dpkg/lock
sudo rm /var/lib/dpkg/lock-frontend
sudo apt-get install -y mongodb-org
sudo systemctl start mongod
sudo systemctl enable mongod
