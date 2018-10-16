# CentOs
cat <<EOF > /etc/yum.repos.d/kubernetes.repo
[kubernetes]
name=Kubernetes
baseurl=https://packages.cloud.google.com/yum/repos/kubernetes-el7-x86_64
enabled=1
gpgcheck=1
repo_gpgcheck=1
gpgkey=https://packages.cloud.google.com/yum/doc/yum-key.gpg
        https://packages.cloud.google.com/yum/doc/rpm-package-key.gpg
EOF
yum install -y kubelet kubeadm kubectl


#############
sudo apt-get update && sudo apt-get install -y apt-transport-https

sudo curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo apt-key add -

sudo su -c "echo deb 'http://apt.kubernetes.io/ kubernetes-xenial main' >> /etc/apt/sources.list.d/kubernetes.list"

sudo apt-get update

apt-get install docker.io
apt-get install -y kubelet kubeadm kubectl kubernetes-cni

systemctl daemon-reload
systemctl restart kubelet
swapoff -a
# run this so it will stay swapoff
sudo sed -i '/ swap / s/^\(.*\)$/#\1/g' /etc/fstab

kubeadm init token=123456.1234567890123456 --token-ttl 0

sudo cp /etc/kubernetes/admin.conf $HOME/
sudo chown $(id -u):$(id -g) $HOME/admin.conf
echo 'export KUBECONFIG=$HOME/admin.conf' >> ~/.bashrc
source ~/.bashrc
#export KUBECONFIG=$HOME/admin.conf

#join
kubeadm join --discovery-token-unsafe-skip-ca-verification --token=123456.1234567890123456 172.17.0.37:6443

# on master, to weave all nodes together
kubectl apply -f "https://cloud.weave.works/k8s/net?k8s-version=$(kubectl version | base64 | tr -d '\n')"

# deploy UI dashboard
kubectl create -f https://raw.githubusercontent.com/kubernetes/dashboard/master/src/deploy/recommended/kubernetes-dashboard.yaml
# complete delete dashboard
#kubectl -n kube-system delete deploy/kubernetes-dashboard svc/kubernetes-dashboard secret/kubernetes-dashboard-certs serviceaccount/kubernetes-dashboard role.rbac.authorization.k8s.io/kubernetes-dashboard-minimal rolebinding.rbac.authorization.k8s.io/kubernetes-dashboard-minimal

port-forward the kubectl proxy
ssh -L 8080:localhost:8001 -i cluster.pem ubtu@10.185.8.203


# grant Admin priv to Service Account
# check kubernetes-dashboard ServiceAccount
# kubectl -n kube-system describe rolebinding kubernetes-dashboard
echo "
apiVersion: rbac.authorization.k8s.io/v1beta1
kind: ClusterRoleBinding
metadata:
  name: kubernetes-dashboard
  labels:
    k8s-app: kubernetes-dashboard
roleRef:
  apiGroup: rbac.authorization.k8s.io
  kind: ClusterRole
  name: cluster-admin
subjects:
- kind: ServiceAccount
  name: kubernetes-dashboard
  namespace: kube-system
"  >> dashboard-admin.yaml
kubectl create -f dashboard-admin.yaml

# change to NodePort
export export KUBE_EDITOR="nano"
kubectl -n kube-system edit service kubernetes-dashboard
# type: NodePort
# get dashboard port
kubectl -n kube-system get svc kubernetes-dashboard
# https://<master ip>:<dashboard port>

# autocomplete kubectl
sudo apt-get install bash-completion
source <(kubectl completion bash)

#check 
kubectl get pod -n kube-system
kubectl get nodes
