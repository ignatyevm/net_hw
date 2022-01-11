a2dissite $1

echo "DROP USER '$1'@'localhost';\nDROP DATABASE $1;" | sudo mysql -u root

sudo rm /var/www/$1.ru
sudo rm -rf /home/$1
rm /etc/apache2/sites-available/$1.conf

sudo service apache2 reload
sudo deluser $1
