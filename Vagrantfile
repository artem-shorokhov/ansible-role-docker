CENTOS = "bento/centos-7.4"
      
DOCKER = { :box => CENTOS,
           :hostname => "docker-registry",
           :ip => "192.168.3.3" }

           
Vagrant.configure("2") do |config|
  
  config.vm.define DOCKER[:hostname] do |host|
  
    host.vm.box = DOCKER[:box]
    host.vm.hostname = DOCKER[:hostname]
    host.vm.network "private_network", ip: DOCKER[:ip]
    
    config.vm.provision "ansible_local" do |ansible|
      ansible.provisioning_path = "/vagrant"
      ansible.inventory_path = "hosts"
      ansible.playbook = "docker-registry.yml"
    end
    
  end

end
