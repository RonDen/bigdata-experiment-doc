$ jps
$ cd /apps/hadoop/sbin
$ ./start-all.sh
$ mkdir -p /data/spark5
$ cd /data/spark5
$ wget http://192.168.1.100:60000/allfiles/spark5/orders
$ wget http://192.168.1.100:60000/allfiles/spark5/order_items
$ hadoop fs -mkdir /myspark5
$ hadoop fs -put /data/spark5/orders /myspark5
$ hadoop fs -put /data/spark5/order_items /myspark5
$ spark-shell

scala> val sqlContext = new org.apache.spark.sql.SQLContext(sc)
scala> import sqlContext.implicits._
scala> case class Orders(order_id:String,order_number:String,buyer_id:String,create_dt:String)
scala> val dforders = sc.textFile("/myspark5/orders").map(_.split('\t')).map(line=>Orders(line(0),line(1),line(2),line(3))).toDF()
scala> dforders.registerTempTable("orders")
scala> sqlContext.sql("show tables").map(t=>"tableName is:"+t(0)).collect().foreach(println)
scala> sqlContext.sql("select order_id,buyer_id from orders").collect
scala> 
scala> import org.apache.spark.sql._
scala> import org.apache.spark.sql.types._
scala> val rddorder_items = sc.textFile("/myspark5/order_items")
scala> val roworder_items = rddorder_items.map(_.split("\t")).map( p=>Row(p(0),p(1),p(2) ) )
scala> val schemaorder_items = "item_id order_id goods_id"
scala> val schema = StructType(schemaorder_items.split(" ").map(fieldName=>StructField(fieldName,StringType,true)) )
scala> val dforder_items = sqlContext.applySchema(roworder_items, schema)
scala> dforder_items.registerTempTable("order_items")
scala> 
scala> sqlContext.sql("show tables").map(t=>"tableName is:"+t(0)).collect().foreach(println)
scala> sqlContext.sql("select order_id,goods_id from order_items ").collect
scala> 
scala> sqlContext.sql("select orders.buyer_id, order_items.goods_id from order_items  join orders on order_items.order_id=orders.order_id ").collect
scala> 
scala> exit

$ spark-sql

spark-sql> create table orders (order_id string,order_number string,buyer_id string,create_dt string)
row format delimited fields terminated by '\t'  stored as textfile;
spark-sql> show tables;
spark-sql> load data inpath '/myspark5/orders' into table orders;
spark-sql> load data inpath '/myspark5/order_items' into table order_items;
spark-sql> select * from orders;
spark-sql> select * from order_items;
spark-sql> select orders.buyer_id, order_items.goods_id from order_items join orders on order_items.order_id=orders.order_id;

