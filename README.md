
## Etapa 1: Configurando a IDE:

Resizing para o disco local do ambiente:

```sh

cd ˜/environment
mkdir scripts
curl -o scripts/resize.sh https://raw.githubusercontent.com/FiapDevOps/automation/main/cloud9/scripts/resize.sh && chmod +x scripts/resize.sh

sh $HOME/environment/scripts/resize.sh 20 > /dev/null
```

Instalando nossas depêndencias:

```sh
# https://developer.hashicorp.com/packer/tutorials/docker-get-started/get-started-install-cli
sudo rm /usr/sbin/packer
sudo yum install -y yum-utils
sudo yum-config-manager --add-repo https://rpm.releases.hashicorp.com/AmazonLinux/hashicorp.repo
sudo yum -y install packer

# https://docs.ansible.com/ansible/latest/installation_guide/intro_installation.html
sudo python -m pip install --upgrade pip
pip install ansible boto3 boto
```

---

Inicie o packer:

```sh
packer init .
```

 É possível executar a validação de sua infraestrutura de forma similar ao processo executado usando terraform:

```sh
packer fmt .
packer validate . 
 ```

 Caso não ocorra nenhum erro dispare a automação via packer:

 ```sh
 packer build packer-linux-ubuntu-cis.pkr.hcl
 ```

 ---

 Fiap MBA 2022


 