#!/usr/bin/env bash

export SPARK_DIST_CLASSPATH=$(/opt/hadoop/bin/hadoop classpath)

export JAVA_HOME=/opt/java
export SCALA_HOME=/home/zhangyu/.sdkman/candidates/scala/2.13.0
export SPARK_WORKING_MEMORY=1g  #每一个worker节点上可用的最大内存
export SPARK_MASTER_IP=master   #驱动器节点IP
export SPARK_CONF_DIR=/home/zhangyu/spark/conf
export HADOOP_HOME=/opt/hadoop
export HADOOP_CONF_DIR=$HADOOP_HOME/etc/hadoop