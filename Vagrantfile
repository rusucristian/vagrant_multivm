BOX = "ubuntu/bionic64"

$script_web = <<-SHELL
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
SHELL

$script_db = <<-SHELL
apt update
apt install mysql-server -y
systemctl start mysql
systemctl enable mysql
mysql -u root -e 'CREATE DATABASE wordpress;'
mysql -u root -e 'CREATE USER wordpress@localhost IDENTIFIED BY "superpuperpassword";'
mysql -u root -e 'GRANT ALL ON wordpress.* TO wordpress@localhost;'
mysql -u root -e 'FLUSH PRIVILEGES;'
SHELL

Vagrant.configure("2") do |config|

  config.vm.define "web01" do |web01|
    web01.vm.box = BOX
    web01.vm.network "private_network", ip: "192.168.56.51"
    
    web01.vm.provider "virtualbox" do |vb|
      vb.memory = "512"
      vb.cpus = 1
    end
    
    web01.vm.provision "web01", type: "shell", inline: $script_web
  end

  config.vm.define "db01" do |db01|
    db01.vm.box = BOX
    db01.vm.network "private_network", ip: "192.168.56.55"
    
    db01.vm.provider "virtualbox" do |vb|
      vb.memory = "512"
      vb.cpus = 1
    end
    
    db01.vm.provision "db01", type: "shell", inline: $script_db
  end

end
