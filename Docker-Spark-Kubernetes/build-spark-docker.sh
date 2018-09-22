
sudo apt-get -y update && \
    sudo apt-get install maven -y && \
    sudo apt-get install --no-install-recommends -y openjdk-8-jre-headless ca-certificates-java && \
    sudo apt-get clean && \
    rm -rf /var/lib/apt/lists/*

echo 'export JAVA_HOME=/usr/lib/jvm/java-8-openjdk-amd64/jre/' >> ~/.bashrc
echo 'export PATH=$PATH:$JAVA_HOME' >> ~/.bashrc

wget http://apache.claz.org/spark/spark-2.3.1/spark-2.3.1-bin-hadoop2.7.tgz
tar xvf spark-2.3.1-bin-hadoop2.7.tgz
sudo mv spark-2.3.1-bin-hadoop2.7 /usr/local/
sudo ln -s /usr/local/spark-2.3.1-bin-hadoop2.7.tgz /usr/local/spark
cd /usr/local/spark
spark_path=`pwd`
echo 'export SPARK_HOME=$spark_path' >> ~/.bashrc
source ~/.bashrc

