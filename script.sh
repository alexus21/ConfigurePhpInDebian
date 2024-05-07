clear

echo "*******************************************"
echo "Instalando PHP 8.2 y Apache2 en tu sistema"
echo "*******************************************"
sleep 5

echo "*******************************************"
echo "Actualizando repositorios de tu sistema..."
echo "*******************************************"
sleep 3
sudo apt update -y && sudo apt upgrade -y

echo "*******************************************"
echo "Instalando lsb_release: "
echo "*******************************************"
sleep 3
sudo apt install lsb-release -y

echo "*******************************************"
echo "Agregando las keys necesarias: "
echo "*******************************************"
sleep 3
wget -qO - https://packages.sury.org/php/apt.gpg | sudo apt-key add -
sudo apt update

echo "*******************************************"
echo "Instalando paquetes necesarios"
echo "*******************************************"
sleep 3
sudo apt install software-properties-common php8.2 apache2
sudo apt install php8.2-cli php8.2-common php8.2-xml php8.2-curl php8.2-mbstring libapache2-mod-php8.2

echo "*******************************************"
echo "Revisando version de php: "
echo "*******************************************"
sleep 3
sudo dpkg --get-selections | grep php
php --version

echo "*******************************************"
echo "Iniciando apache2: "
echo "*******************************************"
sudo systemctl enable --now apache2

echo "*******************************************"
echo "Habilitando servicio de php: "
echo "*******************************************"
sleep 3
sudo a2enmod php8.2

echo "*******************************************"
echo "Instalando postgresql: "
echo "*******************************************"
sleep 3
sudo sh -c 'echo "deb http://apt.postgresql.org/pub/repos/apt/ $(lsb_release -cs)-pgdg main" > /etc/apt/sources.list.d/pgdg.list'
wget -qO - https://postgresql.org/media/keys/ACCC4CF8.asc | sudo apt-key add - 
sudo apt update
sudo apt install -y postgresql

echo "*******************************************"
echo "Instalando driver de postgresql para php: "
echo "*******************************************"
sleep 3
sudo apt install -y php8.2-pgsql

echo "*******************************************"
echo "Iniciando postgresql: "
echo "*******************************************"
sleep 3
sudo systemctl enable --now postgresql

echo "*******************************************"
echo "Revisando version de postgresql: "
echo "*******************************************"
sleep 3
psql --version

echo "*******************************************"
echo "Creando archivo de prueba para PHP: "
echo "*******************************************"
sleep 3
sudo sh -c 'echo "<?php phpinfo(); ?>" > /var/www/html/test.php'


echo "*******************************************"
echo "Ejecutando archivo de prueba: "
echo "*******************************************"
sleep 3
#php /var/www/html/test.php
firefox localhost/test.php &

echo "*******************************************"
echo "Instalando composer: "
echo "*******************************************"
sleep 3
sudo apt install curl php-cli php-mbstring git unzip
cd ~
curl -sS https://getcomposer.org/installer -o composer-setup.php
HASH=`curl -sS https://composer.github.io/installer.sig`
echo $HASH
sleep 3
php -r "if (hash_file('SHA384', 'composer-setup.php') === '$HASH') { echo 'Installer verified'; } else { echo 'Installer corrupt'; unlink('composer-setup.php'); } echo PHP_EOL;"
sleep 3
sudo php composer-setup.php --install-dir=/usr/local/bin --filename=composer
composer --version
sleep 3

echo "*******************************************"
echo "Limpiando tu sistema: "
echo "*******************************************"
sleep 3
sudo apt autoremove -y
