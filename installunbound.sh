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

# Reiniciar Serviço Unbound
systemctl restart unbound

