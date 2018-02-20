# SED-Deployments

This program is in development and is to be used for the Mitre Scout Engineering Day as a Registration Web Service. The front end of the registration service and is written in HTML, JavaScript, Python and CSS; while to back end is done using MySQL. Anyone who would like to help with development please contact Ryan Dufrene at rdufrene@mitre.org, or Walter Hiranpat at whiranpat@mitre.org.


# Installation

### The following tools are needed:
- [Git Bash](https://git-for-windows.github.io/) (only needed for windows)
- [Vagrant](https://www.vagrantup.com/)
- [VirtualBox](https://www.virtualbox.org/wiki/Downloads) (other virtualization services will work, however VirtualBox is recommended)
- [Ansible](http://docs.ansible.com/ansible/latest/intro_installation.html)

### The following are some useful tools:
- [MySQL workbench](http://dev.mysql.com/downloads/workbench/)


## Contributing
Before contributing please make sure you meet the requirements stated in the CONTRIBUTING.md file

### Process to contribute as non-member of the team:
1. Fork the project
2. Create your feature branch: `git checkout -b my-new-feature`
3. Commit your changes: `git commit -am 'Add some feature'`
4. Push to the branch: `git push origin my-new-feature`
5. Submit a pull request


## Setup Local Development Enviorment
This should be done by the command line of your choosing and after the required software above has been installed. (*Note*: Setting up the enviorment will require internet access.)

1. Clone this repository into the folder you would like: `git clone https://github.com/ScoutEngineeringDay/SED-Deployments.git`
2. Enter the new folder: `cd SED-Deployments`
3. Check out the dev branch: `git checkout -t origin/dev`
4. Install Vagrant Virtualbox Guest Additions plugin: `vagrant plugin install vagrant-vbguest`
5. Encrypt your Ansible variables as described in the wiki page on [Ansible Vault](https://github.com/ScoutEngineeringDay/SED-Deployments/wiki/Ansible-Vault)
6. Start Vagrant: `vagrant up`
7. Website should now be on localhost:8080

Now you should have an instance of the website working on your computer that is pulling code live from the `/your_location_choice/content/SED-Deployments/SED-Web-Application` folder. 

## Recompiling Website Code
After making changes to the code located in `/your_location_choice/SED-Deployments/content/SED-Web-Application` you will notice that the website will not automatically update.

The following steps will update the local delpyment of the website:
1. Open command line of your choosing.
2. Enter the folder that holds the repository: `cd /your_location_choice/SED-Deployments`
3. SSH into the Vagrant mechine: `vagrant ssh`
4. Enter the code source: `/ansible`
5. Run the update script: `./SED-web-update.sh`

Wait for the site to recompile and then refresh [http://localhost:8080/](http://localhost:8000/).


## Using Ansible Vault
To provide the password used to decrypt secrets stored in the Ansible Vault, save the password in a file named `/ansible-vault.txt`

Secrets files are named `*.vault.yml` and must all have the same password for decryption. In order to better track the variables stored in vault files, a plaintext version is stored in a corresponding `*.yml` file. It is the developer's responsibility to make sure that changes are reflected in both locations. For information about creating and editing vault files, see [the Ansible documentation](https://docs.ansible.com/ansible/latest/vault.html).


## URLs:

* Local host urls:
  - [http://localhost:8080/](http://localhost:8000/): Local Website Home Page
  - [http://localhost:8080/admin/](http://localhost:8000/admin/): Local	Admin Page

* Main Test Website url:
  - [http://www.sedteam.com/](http://www.sedteam.com/): Website Home Page
  - [http://www.sedteam.com/admin/](http://www.sedteam.com:/admin/): Website Admin Page
