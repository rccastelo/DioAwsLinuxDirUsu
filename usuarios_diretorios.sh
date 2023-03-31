#!/bin/bash

# executar script: chmod +x usuarios_diretorios.sh
# executar script: ./usuarios_diretorios.sh

echo inicio do script para criacao e configuração de usuarios e diretorios

# excluindo diretorios
sudo rmdir /publico
sudo rmdir /adm
sudo rmdir /ven
sudo rmdir /sec
# excluindo usuarios
sudo userdel carlos -r -f
sudo userdel maria -r -f
sudo userdel joao -r -f
sudo userdel debora -r -f
sudo userdel sebastiana -r -f
sudo userdel roberto -r -f
sudo userdel josefina -r -f
sudo userdel amanda -r -f
sudo userdel rogerio -r -f
# excluindo grupos
sudo groupdel GRP_ADM
sudo groupdel GRP_VEN
sudo groupdel GRP_SEC

# criar diretórios
echo criar diretorios
sudo mkdir /publico
sudo mkdir /adm
sudo mkdir /ven
sudo mkdir /sec

# criar grupos
echo criar grupos
sudo groupadd GRP_ADM # adm
sudo groupadd GRP_VEN # ven
sudo groupadd GRP_SEC # sec

# mudar owner (root) e grupo dos diretorios
echo mudar owner e grupo dos diretorios
sudo chown root:root /publico # publico
sudo chown root:GRP_ADM /adm # adm
sudo chown root:GRP_VEN /ven # ven
sudo chown root:GRP_SEC /sec # sec

# criar usuarios
echo criar usuarios
sudo useradd carlos -m -c "Carlos" -s /bin/bash -p $(openssl passwd Carlos123) # carlos
sudo useradd maria -m -c "Maria" -s /bin/bash -p $(openssl passwd Maria123) # maria
sudo useradd joao -m -c "João" -s /bin/bash -p $(openssl passwd Joao123) # joao
sudo useradd debora -m -c "Debora" -s /bin/bash -p $(openssl passwd Debora123) # debora
sudo useradd sebastiana -m -c "Sebastiana" -s /bin/bash -p $(openssl passwd Sebastiana123) # sebastiana
sudo useradd roberto -m -c "Roberto" -s /bin/bash -p $(openssl passwd Roberto123) # roberto
sudo useradd josefina -m -c "Josefina" -s /bin/bash -p $(openssl passwd Josefina123) # josefina
sudo useradd amanda -m -c "Amanda" -s /bin/bash -p $(openssl passwd Amanda123) # amanda
sudo useradd rogerio -m -c "Rogerio" -s /bin/bash -p $(openssl passwd Rogerio123) # rogerio

# incluir usuarios no grupo GRP_ADM
echo incluir usuarios no grupo GRP_ADM
sudo gpasswd -a carlos GRP_ADM
sudo gpasswd -a maria GRP_ADM
sudo gpasswd -a joao GRP_ADM
# incluir usuarios no grupo GRP_VEN
echo incluir usuarios no grupo GRP_VEN
sudo gpasswd -a debora GRP_VEN
sudo gpasswd -a sebastiana GRP_VEN
sudo gpasswd -a roberto GRP_VEN
# incluir usuarios no grupo GRP_SEC
echo incluir usuarios no grupo GRP_SEC
sudo gpasswd -a josefina GRP_SEC
sudo gpasswd -a amanda GRP_SEC
sudo gpasswd -a rogerio GRP_SEC

# permissao total no diretorio publico para todos os usuarios
echo permissao total no diretorio publico para todos os usuarios
sudo chmod 777 /publico
# permissao dos usuarios dentro de seus respectivos diretorios
echo permissao dos usuarios dentro de seus respectivos diretorios
sudo chmod 770 /adm # adm
sudo chmod 770 /ven # ven
sudo chmod 770 /sec # sec

# verificar usuarios existentes
#cat /etc/passwd
# verificar grupos existentes e seus usuarios
#cat /etc/group
# verificar permissão dos diretorios
#ls -l

echo fim do script para criacao e configuração de usuarios e diretorios
