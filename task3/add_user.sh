#! /bin/bash

sudo useradd -d /home/$1 -s /sbin/nologin $1
echo -e "$2\n$2" | sudo passwd $1
sudo mkdir /home/$1
sudo chown -R $1:$1 /home/$1/
sudo chmod 777 /home/$1

echo -e "CREATE DATABASE $1;\nCREATE USER '$1'@'localhost' IDENTIFIED BY '$2';\nGRANT ALL PRIVILEGES ON $1.* TO '$1'@'localhost';\nFLUSH PRIVILEGES;" | sudo mysql -u root

sudo ln -s /home/$1 /var/www/$1.ru

sudo cp /etc/apache2/sites-available/000-default.conf /etc/apache2/sites-available/$1.conf

sed -i -E "s/#ServerName .+/ServerName $1.ru/" /etc/apache2/sites-available/$1.conf
sed -i -E "s/DocumentRoot .+/DocumentRoot \/var\/www\/$1.ru/" /etc/apache2/sites-available/$1.conf

sudo a2ensite $1
sudo service apache2 reload

sudo setquota -u $1 200M 220M 0 0 /
