sudo apt-get update && sudo apt-get install -y apt-transport-https

sudo curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo apt-key add -

sudo su -c "echo deb 'http://apt.kubernetes.io/ kubernetes-xenial main' >> /etc/apt/sources.list.d/kubernetes.list"

sudo apt-get update

apt-get install -y kubelet kubeadm kubectl kubernetes-cni

systemctl daemon-reload
systemctl restart kubelet
swapoff -a
# run this so it will stay swapoff
sudo sed -i '/ swap / s/^\(.*\)$/#\1/g' /etc/fstab

kubeadm init token=123456.1234567890123456 --token-ttl 0

sudo cp /etc/kubernetes/admin.conf $HOME/
sudo chown $(id -u):$(id -g) $HOME/admin.conf
export KUBECONFIG=$HOME/admin.conf

#join
kubeadm join --discovery-token-unsafe-skip-ca-verification --token=123456.1234567890123456 172.17.0.37:6443

# on master
kubectl apply -f "https://cloud.weave.works/k8s/net?k8s-version=$(kubectl version | base64 | tr -d '\n')"

# autocomplete kubectl
sudo apt-get install bash-completion
source <(kubectl completion bash)

#check 
kubectl get pod -n kube-system
kubectl get nodes
