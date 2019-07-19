$ tar zxvf jdk1.8.0xxx.tar.gz
$ sudo mv jdk1.8.0xxx /opt/
$ cd /opt/
$ sudo mv jdk1.8.0xxx java
$ sudo chown zhangyu:zhangyu java
$ vi ~/.bashrc
# Append these lines
# java
export JAVA_HOME=/opt/java
export PATH=$JAVA_HOME/bin:$PATH
$ source ~/.bashrc
$ java -version
# 之后用scp将Java分发到各个节点上去
# 完成同样的配置