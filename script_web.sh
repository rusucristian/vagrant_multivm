apt update
apt install apache2 wget unzip -y
systemctl start apache2
systemctl enable apache2
cd /tmp/
wget https://www.tooplate.com/zip-templates/2108_dashboard.zip
unzip -o 2108_dashboard.zip
cp -r 2108_dashboard/* /var/www/html/
chown -R www-data:www-data /var/www/html
chmod -R 0755 /var/www/html
systemctl restart apache2
