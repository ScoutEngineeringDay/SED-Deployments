#Declare variables to be used
variable aws_access_key {}
variable aws_secret_key {}

#Configure provider
provider "aws" {
	access_key = "${var.aws_access_key}"
	secret_key = "${var.aws_secret_key}"
	region     = "us-east-1"
}

#Provision resources
resource "aws_instance" "web" {
	ami = "ami-55ef662f"
	instance_type = "t2.micro"
	key_name = "terraform-key"
	timeouts {
		create = "15m"
	}
	
	provisioner "remote-exec" {
		inline = [
			"sudo mkdir /ansible",
			"sudo chown ec2-user:ec2-user /ansible"
		]
		connection {
			user = "ec2-user"
			private_key = "${file("terraform-key.pem")}"
		}
	}
	
	provisioner "file" {
		source = "./content/"
		destination = "/ansible"
		connection {
			user = "ec2-user"
			private_key = "${file("terraform-key.pem")}"
		}
	}
	
	provisioner "remote-exec" {
		inline = [
			"sudo pip install ansible",
			"sudo echo 'SED_Dev_Box ansible_connection=local' >> /etc/ansible/hosts",
			"ansible-playbook /ansible/ansible_playbooks/sed.yml -i 'SED_Dev_Box,' -c local"
		]
		connection {
			user = "ec2-user"
			private_key = "${file("terraform-key.pem")}"
			timeout = "15m"
		}
	}
}
