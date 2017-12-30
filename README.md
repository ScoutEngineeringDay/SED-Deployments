# SED-Deployments

## Using Ansible Vault
To provide the password used to decrypt secrets stored in the Ansible Vault, save the password in a file named `/ansible-vault.txt`

Secrets files are named `*.vault.yml` and must all have the same password for decryption. In order to better track the variables stored in vault files, a plaintext version is stored in a corresponding `*.yml` file. It is the developer's responsibility to make sure that changes are reflected in both locations. For information about creating and editing vault files, see [the Ansible documentation](https://docs.ansible.com/ansible/latest/vault.html).
