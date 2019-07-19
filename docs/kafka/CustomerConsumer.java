
import org.apache.kafka.clients.consumer.ConsumerRecord;
import org.apache.kafka.clients.consumer.ConsumerRecords;
import org.apache.kafka.clients.consumer.KafkaConsumer;

import java.util.*;

public class CustomerConsumer {
    private static Object List;
    public static void main(String[] args) {
        Properties props = new Properties();
        props.put("bootstrap.servers", "master:9092");
        props.put("group.id", "test");
        props.put("enable.auto.commit", "false");
        props.put("key.deserializer", "org.apache.kafka.common.serialization.StringDeserializer");
        props.put("value.deserializer", "org.apache.kafka.common.serialization.StringDeserializer");

        KafkaConsumer<String, String> consumer = new KafkaConsumer<>(props);
        /* 用于订阅一个Topic */
        consumer.subscribe(Collections.singletonList("mytest"));
        /* 用于消费多个Topics */
        consumer.subscribe(Arrays.asList("foo", "bar"));
        final int minBatchSize = 200;
        List<ConsumerRecord<String, String>> buffer = new ArrayList<>();

        while (true) {
            ConsumerRecords<String, String> records = consumer.poll(100);
            for (ConsumerRecord<String, String> record : records) {
                System.out.println("record.topic() = " + record.topic() + "---record.offset() = "
                        + record.offset() + "--- record.value() = "
                        + record.value()
                );
                buffer.add(record);
            }
            if (buffer.size() >= minBatchSize) {
//              insertIntoDb(buffer);
                consumer.commitSync();
                buffer.clear();
            }
        }
    }
}
