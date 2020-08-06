#!/bin/bash
DATABASE_URL=$1
export DATABASE_URL
set -e
APP_DIR=${2:-$HOME}
sudo rm -f var/lib/apt/lists/lock
sudo rm -f /var/cache/apt/archives/lock
sudo rm -f /var/lib/dpkg/lock
sudo rm -f /var/lib/dpkg/lock-frontend
sudo dpkg --configure -a
sudo apt-get install -y git
git clone -b monolith https://github.com/express42/reddit.git $APP_DIR/reddit
cd $APP_DIR/reddit
bundle install
sudo mv /tmp/puma.service /etc/systemd/system/puma.service
sudo systemctl start puma
sudo systemctl enable puma