yc compute instance create \
--name reddit-full-app1 \
--hostname reddit-full-app1 \
--memory=4 \
--create-boot-disk name=disk1,size=20GB,image-name=reddit-full-1593369115 \
--network-interface subnet-name=default-ru-central1-a,nat-ip-version=ipv4 \
--metadata serial-port-enable=1

