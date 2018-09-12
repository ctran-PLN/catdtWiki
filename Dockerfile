Last login: Wed Sep 12 12:55:17 on ttys000
C02WD0E8HV2G:~ catdintran$ ssh -p 3022 catdt@127.0.0.1
catdt@127.0.0.1's password: 
Welcome to Ubuntu 18.04.1 LTS (GNU/Linux 4.15.0-34-generic x86_64)

 * Documentation:  https://help.ubuntu.com
 * Management:     https://landscape.canonical.com
 * Support:        https://ubuntu.com/advantage

 * Read about Ubuntu updates for L1 Terminal Fault Vulnerabilities
   (L1TF).

   - https://ubu.one/L1TF

 * Want to make a highly secure kiosk, smart display or touchscreen?
   Here's a step-by-step tutorial for a rainy weekend, or a startup.

   - https://bit.ly/secure-kiosk


 * Canonical Livepatch is available for installation.
   - Reduce system reboots and improve kernel security. Activate at:
     https://ubuntu.com/livepatch

64 packages can be updated.
0 updates are security updates.

Last login: Wed Sep 12 13:33:18 2018 from 10.0.2.2
catdt@catdt-VirtualBox:~$ docker ps -ef| grep kube
unknown shorthand flag: 'e' in -ef
See 'docker ps --help'.
catdt@catdt-VirtualBox:~$ docker ps -a| grep kube
catdt@catdt-VirtualBox:~$ docker images
REPOSITORY                                 TAG                 IMAGE ID            CREATED             SIZE
k8s.gcr.io/kube-proxy-amd64                v1.11.3             be5a6e1ecfa6        3 days ago          97.8 MB
k8s.gcr.io/kube-scheduler-amd64            v1.11.3             ca1f38854f74        3 days ago          56.8 MB
k8s.gcr.io/kube-apiserver-amd64            v1.11.3             3de571b6587b        3 days ago          187 MB
k8s.gcr.io/kube-controller-manager-amd64   v1.11.3             a710d6a92519        3 days ago          155 MB
k8s.gcr.io/coredns                         1.1.3               b3b94275d97c        3 months ago        45.6 MB
k8s.gcr.io/etcd-amd64                      3.2.18              b8df3b177be2        5 months ago        219 MB
k8s.gcr.io/pause                           3.1                 da86e6ba6ca1        8 months ago        742 kB
catdt@catdt-VirtualBox:~$ cat <<EOF > /etc/docker/daemon.json
> { "exec-opts" : ["native.cgroupdriver=systemd"] } EOF
> 
> ^C
catdt@catdt-VirtualBox:~$ cat <<EOF > /etc/docker/daemon.json
{ "exec-opts" : ["native.cgroupdriver=systemd"] }    


> EOF
-bash: /etc/docker/daemon.json: Permission denied
catdt@catdt-VirtualBox:~$ sudo <<EOF > /etc/docker/daemon.json
{ "exec-opts" : ["native.cgroupdriver=systemd"] } EOF


> 
> ^C
catdt@catdt-VirtualBox:~$ sudo <<EOF > /etc/docker/daemon.json
{ "exec-opts" : ["native.cgroupdriver=systemd"] }    


   

> EOF
-bash: /etc/docker/daemon.json: Permission denied
catdt@catdt-VirtualBox:~$ sudo <<OEF > /etc/docker/daemon.json
> { "exec-opts" : ["native.cgroupdriver=systemd"] }
> EOF
> 
> ^C
catdt@catdt-VirtualBox:~$ sudo vi /etc/docker/daemon.json
[sudo] password for catdt: 
catdt@catdt-VirtualBox:~$ cat /etc/docker/daemon.json
cat: /etc/docker/daemon.json: Permission denied
catdt@catdt-VirtualBox:~$ sudo cat /etc/docker/daemon.json
{ "exec-opts" : ["native.cgroupdriver=systemd"] }
catdt@catdt-VirtualBox:~$ sudo vi /etc/systemd/system/kubelet.service.d/10-kubeadm.conf 
catdt@catdt-VirtualBox:~$ sudo echo "--cgroup-driver=systemd" >> /etc/systemd/system/kubelet.service.d/10-kubeadm.conf 
-bash: /etc/systemd/system/kubelet.service.d/10-kubeadm.conf: Permission denied
catdt@catdt-VirtualBox:~$ vim /etc/systemd/system/kubelet.service.d/10-kubeadm.conf 

Command 'vim' not found, but can be installed with:

sudo apt install vim       
sudo apt install vim-gtk3  
sudo apt install vim-tiny  
sudo apt install neovim    
sudo apt install vim-athena
sudo apt install vim-gtk   
sudo apt install vim-nox   

catdt@catdt-VirtualBox:~$ sudo nano /etc/systemd/system/kubelet.service.d/10-kubeadm.conf 
catdt@catdt-VirtualBox:~$ Connection to 127.0.0.1 closed by remote host.
Connection to 127.0.0.1 closed.
C02WD0E8HV2G:~ catdintran$ ssh -p 1111 127.0.0.1
ssh: connect to host 127.0.0.1 port 1111: Connection refused
C02WD0E8HV2G:~ catdintran$ ssh -p 1111 127.0.0.1
ssh: connect to host 127.0.0.1 port 1111: Connection refused
C02WD0E8HV2G:~ catdintran$ 
  [Restored Sep 12, 2018 at 6:51:52 PM]
Last login: Wed Sep 12 18:51:40 on console
C02WD0E8HV2G:~ catdintran$ ssh -p 3022 127.0.0.1
catdintran@127.0.0.1's password: 
Permission denied, please try again.
catdintran@127.0.0.1's password: 
Permission denied, please try again.
catdintran@127.0.0.1's password: 
catdintran@127.0.0.1: Permission denied (publickey,password).
C02WD0E8HV2G:~ catdintran$ ssh -p 3022 127.0.0.1
catdintran@127.0.0.1's password: 
Permission denied, please try again.
catdintran@127.0.0.1's password: 

C02WD0E8HV2G:~ catdintran$ ssh -p 3022 catdt@127.0.0.1
catdt@127.0.0.1's password: 
Welcome to Ubuntu 18.04.1 LTS (GNU/Linux 4.15.0-34-generic x86_64)

 * Documentation:  https://help.ubuntu.com
 * Management:     https://landscape.canonical.com
 * Support:        https://ubuntu.com/advantage

 * Read about Ubuntu updates for L1 Terminal Fault Vulnerabilities
   (L1TF).

   - https://ubu.one/L1TF

 * Want to make a highly secure kiosk, smart display or touchscreen?
   Here's a step-by-step tutorial for a rainy weekend, or a startup.

   - https://bit.ly/secure-kiosk


 * Canonical Livepatch is available for installation.
   - Reduce system reboots and improve kernel security. Activate at:
     https://ubuntu.com/livepatch

64 packages can be updated.
0 updates are security updates.

Last login: Wed Sep 12 14:52:55 2018 from 10.0.2.2
catdt@catdt-VirtualBox:~$ cd catdtWiki/
catdt@catdt-VirtualBox:~/catdtWiki$ ls
Dockerfile  Docker-Spark-Kubernetes  JavaCodes.java  pythonCodes.py  README.md
catdt@catdt-VirtualBox:~/catdtWiki$ git status
On branch master
Your branch is up to date with 'origin/master'.

Untracked files:
  (use "git add <file>..." to include in what will be committed)

	Docker-Spark-Kubernetes/Dockerfile.ppc64le
	Docker-Spark-Kubernetes/Dockerfile.ppc64le.patch
	Docker-Spark-Kubernetes/README.md
	Docker-Spark-Kubernetes/docker-stacks/
	Docker-Spark-Kubernetes/jupyter_notebook_config.py
	Docker-Spark-Kubernetes/spark-2.3.1-bin-hadoop2.7.tgz
	Docker-Spark-Kubernetes/start-notebook.sh
	Docker-Spark-Kubernetes/start-singleuser.sh
	Docker-Spark-Kubernetes/start.sh
	Dockerfile

nothing added to commit but untracked files present (use "git add" to track)
catdt@catdt-VirtualBox:~/catdtWiki$ git add Dockerfile
catdt@catdt-VirtualBox:~/catdtWiki$ git commit -m "for spark"
[master f686bca] for spark
 1 file changed, 40 insertions(+)
 create mode 100644 Dockerfile
catdt@catdt-VirtualBox:~/catdtWiki$ git push
Username for 'https://github.com': catdintran
Password for 'https://catdintran@github.com': 
To https://github.com/catdintran/catdtWiki.git
 ! [rejected]        master -> master (fetch first)
error: failed to push some refs to 'https://github.com/catdintran/catdtWiki.git'
hint: Updates were rejected because the remote contains work that you do
hint: not have locally. This is usually caused by another repository pushing
hint: to the same ref. You may want to first integrate the remote changes
hint: (e.g., 'git pull ...') before pushing again.
hint: See the 'Note about fast-forwards' in 'git push --help' for details.
catdt@catdt-VirtualBox:~/catdtWiki$ vi Dockerfile 



RUN chown -R 1000:1000 /spark-2.0.0-bin-hadoop2.7
RUN echo "SPARK_LOCAL_IP=127.0.0.1" > /spark-2.0.0-bin-hadoop2.7/conf/spark-env.sh
RUN groupadd -g 1000 packt
RUN useradd -g 1000 -u 1000 --shell /bin/bash packt
RUN usermod -a -G sudo packt
RUN mkdir /home/packt
RUN chown packt:packt /home/packt
RUN echo "StrictHostKeyChecking no" >> /etc/ssh/ssh_config
RUN echo "packt ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers
USER packt
RUN ssh-keygen -f /home/packt/.ssh/id_rsa -t rsa -N ''
RUN cp /home/packt/.ssh/id_rsa.pub /home/packt/.ssh/authorized_keys
ENV JAVA_HOME=/usr/java/default/
ENV SPARK_HOME=/spark-2.0.0-bin-hadoop2.7/
RUN echo "export JAVA_HOME=/usr/java/default/" >> /home/packt/.bashrc
RUN echo "export SPARK_HOME=/spark-2.0.0-bin-hadoop2.7/" >> /home/packt/.bashrc
RUN echo ". ~/.bashrc" >> /home/packt/.bash_profile
#Allow external connections to the cluster
#EXPOSE 8080
#EXPOSE 8081
