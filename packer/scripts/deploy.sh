#!/bin/bash

echo "Install Git"
sudo apt-get install -y git apt-transport-https

echo "Install App"
cd /srv
git clone -b monolith https://github.com/express42/reddit.git
cd /srv/reddit && bundle install
