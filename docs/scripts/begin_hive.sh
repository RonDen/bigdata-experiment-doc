# 更新软件源，如果必要的话
$ sudo apt update
# 安装mysql，设置root用户密码：password
$ sudo apt install mysql-server
$ mysql -u root -p password
mysql> create database hive;
# 由于配置的是远程访问
# 可能需要设置mysql访问的主机权限
mysql> use mysql;
mysql> select user, host from user;
mysql> flush privilege;
mysql> exit;
# 初次连接，使用schema-tool初始化mysql中Hive数据库中的表
$ schema-tool --initSchema
# 测试运行
$ hive