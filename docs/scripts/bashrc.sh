# java
export JAVA_HOME=/opt/java
export PATH=$JAVA_HOME/bin:$PATH

# hadoop
export HADOOP_HOME=/opt/hadoop
export HADOOP_CONF_DIR=$HADOOP_HOME/etc/hadoop
export PATH=$HADOOP_HOME/bin:$PATH
export PATH=$HADOOP_HOME/sbin:$PATH

# zookeeper
export ZOOKEEPER_HOME=/home/zhangyu/zookeeper
export PATH=$ZOOKEEPER_HOME/bin:$PATH
export ZOOKEEPER_CONF_DIR=$ZOOKEEPER_HOME/conf

# hive config
export HIVE_HOME=/home/zhangyu/hive
export HIVE_CONF_DIR=$HIVE_HOME/conf
export PATH=$HIVE_HOME/bin:$PATH
CLASSPATH==$CLASSPATH:$HIVE_HOME/bin

# hbase config
export HBASE_HOME=/home/zhangyu/hbase
export HBASE_CONF_DIR=$HBASE_HOME/conf
export PATH=$HBASE_HOME/bin:$PATH

# maven config
export PATH=/home/zhangyu/maven/bin:$PATH

# add the spark bin
export SPARK_HOME=/home/zhangyu/spark
export SPARK_CONF_DIR=$SPARK_HOME/conf
export PATH=$SPARK_HOME/bin:$PATH

# flume
export FLUME_HOME=/home/zhangyu/flume
export FLUME_CONF_DIR=/home/zhangyu/flume/conf
export PATH=$FLUME_HOME/bin:$PATH

# sqoop
export SQOOP_HOME=/home/zhangyu/sqoop
export SQOOP_CONF_DIR=/home/zhangyu/sqoop/conf
export PATH=$SQOOP_HOME/bin:$PATH

# kafka
export KAFKA_HOME=/home/zhangyu/kafka
export KAFKA_CONF_DIR=/home/zhangyu/kafka/config
export PATH=$KAFKA/bin:$PATH

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="/home/zhangyu/.sdkman"
[[ -s "/home/zhangyu/.sdkman/bin/sdkman-init.sh" ]] && source "/home/zhangyu/.sdkman/bin/sdkman-init.sh"
