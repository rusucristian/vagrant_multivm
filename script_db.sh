apt update
apt install mysql-server -y
systemctl start mysql
systemctl enable mysql
mysql -u root -e 'CREATE DATABASE wordpress;'
mysql -u root -e 'CREATE USER wordpress@localhost IDENTIFIED BY "superpuperpassword";'
mysql -u root -e 'GRANT ALL ON wordpress.* TO wordpress@localhost;'
mysql -u root -e 'FLUSH PRIVILEGES;'
