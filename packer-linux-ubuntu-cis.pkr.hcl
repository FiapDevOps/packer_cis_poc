packer {
  required_plugins {
    amazon = {
      version = ">= 0.0.2"
      source  = "github.com/hashicorp/amazon"
    }
  }
}

source "amazon-ebs" "ubuntu" {
  ami_name      = "packer-linux-ubuntu-cis-section-1"
  instance_type = "t3.medium"
  region        = "us-east-1"
  source_ami_filter {
    filters = {
      name                = "ubuntu/images/hvm-ssd/ubuntu-jammy-22.04-amd64-server-*"
      root-device-type    = "ebs"
      virtualization-type = "hvm"
    }
    most_recent = true
    owners      = ["099720109477"]
  }
  ssh_username = "ubuntu"
}

build {
  name = "packer-linux-ubuntu-cis"
    sources = [
        "source.amazon-ebs.ubuntu"
    ]
    
    provisioner "ansible" {
    user = "ubuntu"
    use_proxy = false
    command = "ansible-playbook"
    playbook_file  = "site.yml"
    extra_arguments = ["--tags", "section1"]
 }
}