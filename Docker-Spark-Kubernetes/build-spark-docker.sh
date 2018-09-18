wget http://apache.claz.org/spark/spark-2.3.1/spark-2.3.1-bin-hadoop2.7.tgz
tar xvf spark-2.3.1-bin-hadoop2.7.tgz
cd spark-2.3.1-bin-hadoop2.7
docker build -t catdt-spark:2.3 -f kubernetes/dockerfiles/spark/Dockerfile .

#create namespace
kubectl create -f catdtWiki/Docker-Spark-Kubernetes/namespace-spark-cluster.yaml

# create a new context using our current context as a base
CURRENT_CONTEXT=$(kubectl config view -o jsonpath='{.current-context}')
USER_NAME=$(kubectl config view -o jsonpath='{.contexts[?(@.name == "'"${CURRENT_CONTEXT}"'")].context.user}')
CLUSTER_NAME=$(kubectl config view -o jsonpath='{.contexts[?(@.name == "'"${CURRENT_CONTEXT}"'")].context.cluster}')
kubectl config set-context spark --namespace=spark-cluster --cluster=${CLUSTER_NAME} --user=${USER_NAME}
kubectl config use-context spark
