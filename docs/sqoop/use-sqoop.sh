# 列出数据库
$ sqoop list-databases \
> connect jdbc:mysql://master:3306/ \
> -username root \
> -password password
# 列出数据库中的表
$ sqoop list-tables \
> connect jdbc:mysql://master:3306/hive \
> -username root \
> -password password
# 导入数据到HDFS
$ sqoop import \
> connect jdbc:mysql://master:3306/mysqoop \
> -username root \
> -password password \
> -table student \
> -m 1 \
> -target-dir /mysqoop/test/mystu
# 导入数据到HBase
$ sqoop import \
> connect jdbc:mysql://master:3306/mysqoop \
> -username root \
> -password password \
> -table student \
> -hbase-create-table \
> -hbase-table mystu \
> -column-family mycf \
> -hbase-row-key id
