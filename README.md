# ilyafedotov_infra
ilyafedotov Infra repository

Подключение к someinternalhost в одну строку:
```
  ssh -i ~/.ssh/appuser -J appuser@84.201.175.83 appuser@10.130.0.26
```

Подключение вида "ssh someinternalhost":
```
  cat ~/.ssh/config
  Host bastion
        HostName 84.201.175.83
        IdentityFile ~/.ssh/appuser
        User appuser

  Host someinternalhost
        HostName 10.130.0.26
        IdentityFile ~/.ssh/appuser
        User appuser
        ProxyCommand ssh -q -W %h:%p bastion
```

```
bastion_IP = 84.201.175.83
someinternalhost_IP = 10.130.0.26
testapp_IP = 84.201.130.13
testapp_port = 9292
```
        
Создание инстанса с использованием startup script:
```
yc compute instance create \
  --name reddit-app1 \
  --hostname reddit-app1 \
  --memory=4 \
  --create-boot-disk image-folder-id=standard-images,image-family=ubuntu-1604-lts,size=10GB \
  --network-interface subnet-name=default-ru-central1-a,nat-ip-version=ipv4 \
  --metadata serial-port-enable=1 \
  --zone ru-central1-a \
  --metadata-from-file user-data=meta.yaml
```
# HW-7
- Создан образ VM с помощью packer (packer/ubuntu16.json)
- Выполнено параметризирование шаблона (packer/variables.json.example)
- Выполнена конфигурация bake-образа (packer/immutable.json)
- Создан скрипт для создания VM create-reddit-vm.sh (config-scripts/create-reddit-vm.sh)

# HW-8
- Создано описание инфраструктуры для развертывание с помощью Terraform


