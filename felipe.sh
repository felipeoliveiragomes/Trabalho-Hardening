

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


# Regra Para liberar o SSH

iptables -F INPUT
iptables -F OUTPUT
iptables -F FORWARD


iptables -A INPUT -p tcp --dport 22 -j ACCEPT   
iptables -A OUTPUT -p tcp --sport 22 -j ACCEPT   

