# 启动Kafka，需要先启动ZK服务，假设已经启动了
bin/kafka-server-start.sh config/server.properties
# 创建主题Topic
bin/kafka-topics.sh --create --zookeeper master:2181 \
--replication-factor 1 \
--partitions 1 \
--topic test
# 查看有哪些主题
bin/kafka-topics.sh --list \
--zookeeper master:2181
# 开始生产数据
bin/kafka-console-producer.sh \
--broker-list master:9092 \
--topic test
# 新建另一个窗口开始消费数据
bin/kafka-console-consumer.sh \
--bootstrap-server master:2181 \
--topic test \
--from-beginning
