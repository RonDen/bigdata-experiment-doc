$ mkdir -p /data/spark3/wordcount
$ cd /data/spark3/wordcount
$ wget http://192.168.1.100:60000/allfiles/spark3/wordcount/buyer_favorite
$ jps
$ /apps/hadoop/sbin/start-all.sh
$ /apps/spark/sbin/start-all.sh
$ jps
$ hadoop fs -mkdir -p /myspark3/wordcount
$ hadoop fs -put /data/spark3/wordcount/buyer_favorite /myspark3/wordcount
