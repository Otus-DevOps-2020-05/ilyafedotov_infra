# ilyafedotov_infra
ilyafedotov Infra repository

Подключение к someinternalhost в одну строку:
  ssh -i ~/.ssh/appuser -J appuser@84.201.175.83 appuser@10.130.0.26
  
Подключение вида "ssh someinternalhost":
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
        

bastion_IP = 84.201.175.83
someinternalhost_IP = 10.130.0.26
        
