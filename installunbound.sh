#!/bin/bash
# Atualizar Sistema
yum update -y

# Instalar Unbound e Utilitarios
yum install -y unbound wget bind-utils

# Entra na pasta Raiz do Unbound
cd /etc/unbound

# Apagar arquivo root.key do Unbound
rm root.key -f

# Baixar root.key
wget http://www.internic.net/domain/named.root

# Adicionar root.key
unbound-anchor -a /etc/unbound/root.key -v

# Permissão Unbound
chown unbound.unbound /etc/unbound/ -R

# reiniciar serviço unbound
systemctl start unbound

# Backup Arquivo Default Unbound
mv unbound.conf unbound.conf.back

# Baixar aquivo unbound.conf
wget https://raw.githubusercontent.com/leonardocassio/unboundinstall/master/unbound.conf

# Permissão Unbound
chown unbound.unbound /etc/unbound/ -R

# Iniciar Unbound no Boot
systemctl enable unbound

# Iniciar serviço unbound
systemctl start unbound

# Testar Servidor DNS
dig @127.0.0.1 nic.br