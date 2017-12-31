# Application: Scout Engineering Day
# Author: Walter Hiranpat and Phillip Marlow
# Hashicorp Vagrant

#
Vagrant.configure("2") do |config|
  # if Vagrant.has_plugin?("vagrant-proxyconf")
  #   config.proxy.http     = ""
  #   config.proxy.https    = ""
  #   config.proxy.no_proxy = "localhost,127.0.0.1,.example.com"
  # end
  config.ssh.insert_key = false #set same private ssh keys
  config.vm.box_download_insecure = true
  config.vm.synced_folder "./", "/vagrant", type: "virtualbox"
  config.vm.synced_folder "./", "/ansible", type: "virtualbox"
  # config.vm.define "SED_Vault" do |vault|
  
  # end
  config.vm.define "SED_Dev_Box" do |sed|
    sed.vm.box = "centos/7"
    # Configure Virtualbox VM network
    sed.vm.network :private_network, ip: "10.1.1.33"
    # Open Ports for host to connect to virtual machine's containers
    # Consul
    # Vault
    # Django
    # MySQL
    # Presentation
    #
    sed.vm.network "forwarded_port", guest:3306, host:3306
    sed.vm.network "forwarded_port", guest:8000, host:8080
    sed.vm.network "forwarded_port", guest:80, host:8081
    sed.vm.network "forwarded_port", guest:9000, host:9000
    sed.vm.network "forwarded_port", guest:9001, host:9001
    sed.vm.network "forwarded_port", guest:9002, host:9002
    sed.vm.network "forwarded_port", guest:9003, host:9003
    sed.ssh.forward_agent = true

    sed.vm.synced_folder "./content", "/ansible", type: "virtualbox", create:true

    # Configure Virtualbox VM Specifications
    sed.vm.provider "virtualbox" do |vbox|
      vbox.name = "SED_Dev_Box_vagrant"
      vbox.gui = false
      vbox.memory = 2048
      vbox.cpus = 2
    end

    sed.vm.provision "shell" do |s|
      s.inline = "mkdir -p /etc/ansible/facts.d; cp /vagrant/facts/common.fact /etc/ansible/facts.d/; chmod -x /etc/ansible/facts.d/common.fact"
      s.privileged = true
    end

    # Configure Ansible Configuration script
    # Note: run Ansible within the vagrant therefore will not need to install Ansible onto Host machine
    sed.vm.provision "ansible_local" do |ansible|
      ansible.limit = 'all'
      # Playbook
      ansible.playbook = "content/ansible_playbooks/sed.yml"
      # Display how detail
      ansible.verbose = "vvvv"
	    ansible.vault_password_file = "ansible-vault.sh"
    end
  end
end
