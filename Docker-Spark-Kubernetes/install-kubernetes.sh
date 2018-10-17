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

kubeadm init 
kubeadm token create 123456.1234567890123456 --ttl 0

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
cat <<EOF | kubectl create -f - 
apiVersion: v1
kind: ServiceAccount
metadata:
  name: admin-user
  namespace: kube-system
---
apiVersion: rbac.authorization.k8s.io/v1beta1
kind: ClusterRoleBinding
metadata:
  name: admin-user
roleRef:
  apiGroup: rbac.authorization.k8s.io
  kind: ClusterRole
  name: cluster-admin
subjects:
- kind: ServiceAccount
  name: admin-user
  namespace: kube-system
EOF
# get token
kubectl -n kube-system describe secret $(kubectl -n kube-system get secret | grep admin-user | awk '{print $1}')
# launch browser
open http://localhost:8080/api/v1/namespaces/kube-system/services/https:kubernetes-dashboard:/proxy/

cat <<EOF > cluster-admin.yaml
apiVersion: rbac.authorization.k8s.io/v1beta1
kind: ClusterRoleBinding
metadata:
  name: fabric8-rbac
subjects:
  - kind: ServiceAccount
    # Reference to upper's `metadata.name`
    name: default
    # Reference to upper's `metadata.namespace`
    namespace: default
roleRef:
  kind: ClusterRole
  name: cluster-admin
  apiGroup: rbac.authorization.k8s.io
EOF
kubectl apply -f cluster-admin.yaml


#list netstat port with PID
netstat -tlp

# autocomplete kubectl
sudo apt-get install bash-completion
source <(kubectl completion bash)

#check 
kubectl get pod -n kube-system
kubectl get nodes
