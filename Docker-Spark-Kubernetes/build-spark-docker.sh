wget http://apache.claz.org/spark/spark-2.3.1/spark-2.3.1-bin-hadoop2.7.tgz
tar xvf spark-2.3.1-bin-hadoop2.7.tgz
cd spark-2.3.1-bin-hadoop2.7.tgz
docker build -t timfpark/spark:2.3 -f kubernetes/dockerfiles/spark/Dockerfile .
docker push -t timfpark/spark:2.3
