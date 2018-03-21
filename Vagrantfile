CENTOS = "bento/centos-7.4"

REGISTRY = { :box => CENTOS,
             :hostname => "registry",
             :ip => "192.168.3.3" }

CLIENT   = { :box => CENTOS,
             :hostname => "client",
             :ip => "192.168.3.33" }
           
Vagrant.configure("2") do |config|
  
  config.vm.define REGISTRY[:hostname] do |host|
  
    host.vm.box = REGISTRY[:box]
    host.vm.hostname = REGISTRY[:hostname]
    host.vm.network "private_network", ip: REGISTRY[:ip]
    
    config.vm.provision "ansible_local" do |ansible|
      ansible.provisioning_path = "/vagrant"
      ansible.inventory_path = "hosts"
      ansible.playbook = "docker-registry.yml"
    end
    
  end
  
  config.vm.define CLIENT[:hostname] do |host|
  
    host.vm.box = CLIENT[:box]
    host.vm.hostname = CLIENT[:hostname]
    host.vm.network "private_network", ip: CLIENT[:ip]
    
    config.vm.provision "ansible_local" do |ansible|
      ansible.provisioning_path = "/vagrant"
      ansible.inventory_path = "hosts"
      ansible.playbook = "docker-client.yml"
    end
    
  end  

end
