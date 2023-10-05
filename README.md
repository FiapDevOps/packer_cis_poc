
## Etapa 1: Configurando a IDE:

Resizing para o disco local do ambiente:

```sh
mkdir scripts
curl -o scripts/resize.sh https://raw.githubusercontent.com/FiapDevOps/automation/main/cloud9/scripts/resize.sh && chmod +x scripts/resize.sh

sh $HOME/environment/scripts/resize.sh 20 > /dev/null
```

---

## Etapa 2: Instalando nossas depêndencias:

```sh
sudo rm /usr/sbin/packer
sudo yum install -y yum-utils
sudo yum-config-manager --add-repo https://rpm.releases.hashicorp.com/AmazonLinux/hashicorp.repo
sudo yum -y install packer
python3 -m pip install --user ansible
```

# https://developer.hashicorp.com/packer/tutorials/docker-get-started/get-started-install-cli
# https://docs.ansible.com/ansible/latest/installation_guide/intro_installation.html

---

## Etapa 3: Testando o método para gerar uma Golden Image:

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

 Fiap MBA 2023