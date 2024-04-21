clear

echo "Instalando PHP 8.2 y Apache2 en tu sistema"
sleep 5

echo "Actualizando repositorios de tu sistema..."
sleep 3
sudo apt update -y && sudo apt upgrade -y

echo "Instalando lsb_release: "
sleep 3
sudo apt install lsb-release -y

echo "Agregando las keys necesarias: " 
sleep 3
wget -qO - https://packages.sury.org/php/apt.gpg | sudo apt-key add -
sudo apt update

echo "Instalando paquetes necesarios"
sleep 3
sudo apt install software-properties-common php8.2 apache2
sudo apt install php8.2-cli php8.2-common php8.2-xml php8.2-curl php8.2-mbstring libapache2-mod-php8.2

echo "Revisando version de php: "
sleep 3
sudo dpkg --get-selections | grep php
php --version

echo "Iniciando apache2: "
sudo systemctl enable --now apache2

echo "Habilitando servicio de php: "
sleep 3
sudo a2enmod php8.2

echo "Instalando postgresql: "
sleep 3
sudo sh -c 'echo "deb http://apt.postgresql.org/pub/repos/apt/ $(lsb_release -cs)-pgdg main" > /etc/apt/sources.list.d/pgdg.list'
wget -qO - https://postgresql.org/media/keys/ACCC4CF8.asc | sudo apt-key add - 
sudo apt update
sudo apt install -y postgresql

echo "Instalando driver de postgresql para php: "
sleep 3
sudo apt install -y php8.2-pgsql

echo "Iniciando postgresql: "
sleep 3
sudo systemctl enable --now postgresql

echo "Revisando version de postgresql: "
sleep 3
psql --version

echo "Creando archivo de prueba para PHP: "
sleep 3
sudo sh -c 'echo "<?php phpinfo(); ?>" > /var/www/html/test.php'

echo "Ejecutando archivo de prueba: "
sleep 3
#php /var/www/html/test.php
firefox localhost/test.php

echo "Limpiando tu sistema: "
sleep 3
sudo apt autoremove -y
