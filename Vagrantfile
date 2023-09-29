# -*- mode: ruby -*-
# vi: set ft=ruby :

# All Vagrant configuration is done below. The "2" in Vagrant.configure
# configures the configuration version (we support older styles for
# backwards compatibility). Please don't change it unless you know what
# you're doing.

machines  = {
  "christian" => {"memory" => "1024", "cpu" => "2", "ip" => "15", "image" => "ubuntu/focal64" },
  "felipe" => {"memory" => "1024", "cpu" => "2",  "ip" => "16","image" => "ubuntu/focal64" },
}

Vagrant.configure("2") do |config|

  machines.each do |name, conf|
    config.vm.define "#{name}" do |machine|
      machine.vm.box = "#{conf["image"]}"
      machine.vm.hostname = "#{name}.servidor"
      machine.vm.network "private_network", ip: "192.168.56.#{conf["ip"]}"
        machine.vm.provider "virtualbox" do |vb|
          vb.name = "#{name}"
          vb.memory = conf["memory"]
          vb.cpus = conf["cpu"]
        end
        if "#{name}" == "felipe"
          machine.vm.provision "shell", path: "felipe.sh"
        else
          machine.vm.provision "shell", path: "christian.sh"
        end
      
    end
  end
end