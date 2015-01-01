# Dockerfile for ZooKeeper

FROM dockerfile/java:oracle-java8

# Get latest stable release of ZooKeeper
RUN wget -q -O - http://mirrors.sonic.net/apache/zookeeper/zookeeper-3.4.6/zookeeper-3.4.6.tar.gz \
  | tar -C /opt -xz

RUN mkdir /tmp/zookeeper
WORKDIR /opt/zookeeper-3.4.6/
ADD zoo.cfg /opt/zookeeper-3.4.6/conf/

EXPOSE 2181
CMD bin/zkServer.sh start-foreground
