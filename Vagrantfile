BOX = "ubuntu/bionic64"


Vagrant.configure("2") do |config|

  config.vm.define "web01" do |web01|
    web01.vm.box = BOX
    web01.vm.network "private_network", ip: "192.168.56.51"
    
    web01.vm.provider "virtualbox" do |vb|
      vb.memory = "512"
      vb.cpus = 1
    end
    
    web01.vm.provision "web01", type: "shell", path: "script_web.sh"
  end

  config.vm.define "db01" do |db01|
    db01.vm.box = BOX
    db01.vm.network "private_network", ip: "192.168.56.55"
    
    db01.vm.provider "virtualbox" do |vb|
      vb.memory = "512"
      vb.cpus = 1
    end
    
    db01.vm.provision "db01", type: "shell", path: "script_db.sh"
  end

end
