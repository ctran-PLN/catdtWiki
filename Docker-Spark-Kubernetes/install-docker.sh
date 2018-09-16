# uninstall old versions
sudo apt-get remove docker docker-engine docker.io

sudo apt-get update

# install to allow `apt` to use a repo over HTTPS
sudo apt-get install \
    apt-transport-https \
    ca-certificates \
    curl \
    software-properties-common

# all Docker's GPG key
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -

# for older docker version
#curl -fsSL https://apt.dockerproject.org/gpg | sudo apt-key add -

# verify key fingerprint
sudo apt-key fingerprint 0EBFCD88

#set up the stable repository
sudo add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
   stable"

#sudo apt-add-repository "deb https://apt.dockerproject.org/repo ubuntu-$(lsb_release -cs) main"

sudo apt-get update
#apt-cache madison docker-ce
sudo apt-get install docker-ce

sudo groupadd docker
sudo usermod -aG docker $USER
sudo reboot

# install docker 17.03 Kubernetes
sudo su

#openssh-server
apt-get install openssh-server
# install to allow `apt` to use a repo over HTTPS
sudo apt-get install \
    apt-transport-https \
    ca-certificates \
    curl \
    software-properties-common

# all Docker's GPG key
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -

apt-get update

# get docker 1.13.1
curl -L -O https://packages.docker.com/1.13/apt/repo/pool/main/d/docker-engine/docker-engine_1.13.1~cs8-0~ubuntu-xenial_amd64.deb
# install docker
dpkg -i ./docker-engine_1.13.1~cs8-0~ubuntu-xenial_amd64.deb
rm docker-engine_1.13.1~cs8-0~ubuntu-xenial_amd64.deb
# start docker engine
service docker start 

