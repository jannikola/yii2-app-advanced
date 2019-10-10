# Install php and other packages needed
sudo apt install software-properties-common -y
sudo LC_ALL=C.UTF-8 add-apt-repository ppa:ondrej/php -y
sudo apt update -y
sudo apt install php7.3 php7.3-cli php7.3-common php7.3-mbstring php7.3-intl php7.3-mysql -y
sudo apt install curl git unzip -y

# Remove apache packages and install nginx
sudo apt purge  apache2 apache2-bin apache2-data apache2-utils -y
sudo apt install nginx -y

# Install Composer
sudo curl -s https://getcomposer.org/installer | php
sudo mv composer.phar /usr/local/bin/composer
sudo chmod +x /usr/local/bin/composer
sudo composer self-update

cd /var/www
sudo chown -R vagrant:vagrant /home/vagrant/.composer
sudo -u vagrant composer install
sudo -u vagrant php init --env=Development --overwrite=Yes

echo "CREATE DATABASE IF NOT EXISTS advanced" | mysql -u root -proot
sudo -u vagrant php yii migrate --interactive=0

echo "Provision finished!"
