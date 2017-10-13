# Application: Scout Engineering Day
# Author: Walter Hiranpat
# Hashicorp Vagrant

# 
Vagrant.configure("2") do |config|
  config.ssh.insert_key = false #set same private ssh keys
  config.vm.box_download_insecure = true
  # config.vm.define "SED_Vault" do |vault|
    
  # end
  config.vm.define "SED_Dev_Box" do |sed|
    sed.vm.box = "centos/7"
    # Configure Virtualbox VM network
    sed.vm.network :private_network, ip: "10.1.1.33"
    sed.vm.network "forwarded_port", guest:5432, host:5432
    sed.ssh.forward_agent = true
    
    # Configure Virtualbox VM Specifications
    sed.vm.provider "virtualbox" do |vbox|
      vbox.name = "SED_Dev_Box_vagrant"
      vbox.gui = false
      vbox.memory = 2048
      vbox.cpus = 2
    end

    # Configure Ansible Configuration script
    # Note: run Ansible within the vagrant therefore will not need to install Ansible onto Host machine
    sed.vm.provision "ansible_local" do |ansible|
      ansible.limit = 'all'
      # Playbook
      ansible.playbook = "ansible_playbooks/sed.yml"
      # Display how detail
      ansible.verbose = "vvvv"
    end
  end
end