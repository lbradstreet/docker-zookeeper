# Dockerfile for ZooKeeper

FROM dockerfile/java:oracle-java8

#RUN apt-get update
#RUN apt-get -y install python

# Get latest stable release of ZooKeeper
RUN wget -q -O - http://mirrors.sonic.net/apache/zookeeper/zookeeper-3.4.6/zookeeper-3.4.6.tar.gz \
  | tar -C /opt -xz

WORKDIR /opt/zookeeper-3.4.6/
ADD zoo.cfg /opt/zookeeper-3.4.6/conf/

EXPOSE 2181
CMD bin/zkServer.sh start-foreground
