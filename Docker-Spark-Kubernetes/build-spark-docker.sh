
sudo apt-get -y update && \
    sudo apt-get install maven -y && \
    sudo apt-get install --no-install-recommends -y openjdk-8-jre-headless ca-certificates-java && \
    sudo apt-get clean && \
    rm -rf /var/lib/apt/lists/*

wget http://apache.claz.org/spark/spark-2.3.1/spark-2.3.1-bin-hadoop2.7.tgz
tar xvf spark-2.3.1-bin-hadoop2.7.tgz
cd spark-2.3.1-bin-hadoop2.7
spark_path=aa=$(echo pwd)
echo 'export SPARK_HOME=$spark_path' >> ~/.bashrc
echo 'export JAVA_HOME=/usr/lib/jvm/java-8-openjdk-amd64/jre/' >> ~/.bashrc
echo 'export PATH=$PATH:$JAVA_HOME' >> ~/.bashrc

source ~/.bashrc

