

#mantendo maquina atulizada
sudo apt-get update

sudo apt-get -y upgrade

#removendo qualquer interface gráfica
sudo apt-get remove kde gnome xfce lxde  -y



#instalando o fail2ban, ferramenta para seguranca
sudo apt-get -y install fail2ban

#Instalando o neet tools, para caso deseje usar os cpmandos mais atingos de admnistracao de rede
sudo apt-get -y install net-tools 

#instalando ferramenta para detecao de rookits no linux
sudo apt-get -y install chkrootkit 



#instalando pacote que fornece opções para criptografia de arquivos de sistema
sudo apt-get install -y ecryptfs-utils 

# Desabilitando modulos USB
echo 'install usb-storage /bin/true' >> /etc/modprobe.d/disable-usb-storage.conf

# Desabilitando modulos firmware
echo "blacklist firewire-core" >> /etc/modprobe.d/firewire.conf

# Desabilitando modulos thunderbolt
echo "blacklist thunderbolt" >> /etc/modprobe.d/thunderbolt.conf


sudo cp /etc/fail2ban/jail.conf /etc/fail2ban/jail.local

sudo echo '[ssh]' >> /etc/fail2ban/jail.local
sudo echo enabled = true >> /etc/fail2ban/jail.local
sudo echo filter = sshd >> /etc/fail2ban/jail.local
sudo echo action = iptables[name=ssh, port=”ssh”, protocol=tcp] >> /etc/fail2ban/jail.local
sudo echo logpath = /var/log/auth.log >> /etc/fail2ban/jail.local
sudo echo maxretry = 3 >> /etc/fail2ban/jail.local
sudo echo bantime = 3600 >> /etc/fail2ban/jail.local
sudo echo ignoreip = 127.0 >> /etc/fail2ban/jail.local


sudo systemctl restart fail2ban

iptables -F INPUT
iptables -F OUTPUT
iptables -F FORWARD

#Para bloquear o SMTP
iptables -A INPUT -p tcp --dport 25  -j DROP
iptables -A OUTPUT -p tcp --sport 25  -j DROP

#Para bloquear HTTP
iptables -A INPUT  -p tcp --dport 80 -j DROP
iptables -A OUTPUT -p tcp --sport 80 -j DROP

# Para liberar o https
iptables -A INPUT  -p tcp --dport 443 -j ACCEPT
iptables -A OUTPUT -p tcp --sport 443 -j ACCEPT

#Para liberar o IMAP
iptables -A INPUT -p tcp --dport 143 -j ACCEPT
iptables -A OUTPUT -p tcp --sport 143  -j ACCEPT

#Regra para liberar o ssh
iptables -A INPUT -p tcp --dport 22 -j ACCEPT   
iptables -A OUTPUT -p tcp --sport 22 -j ACCEPT   

