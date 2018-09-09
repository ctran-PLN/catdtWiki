#wget http://apache.claz.org/spark/spark-2.3.1/spark-2.3.1-bin-hadoop2.7.tgz
#tar xvf spark-2.3.1-bin-hadoop2.7.tgz
cd spark-2.3.1-bin-hadoop2.7
docker build -t catdt/spark:2.3 -f kubernetes/dockerfiles/spark/Dockerfile .

docker tag catdt-spark catdintran/catdt/spark:firsttry
docker push catdintran/catdt/spark

