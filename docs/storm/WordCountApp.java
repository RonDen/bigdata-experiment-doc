package io.storm;

import io.storm.spout.RandomSentenceSpout;
import org.apache.storm.Config;
import org.apache.storm.LocalCluster;
import org.apache.storm.StormSubmitter;
import org.apache.storm.task.OutputCollector;
import org.apache.storm.task.TopologyContext;
import org.apache.storm.topology.*;
import org.apache.storm.topology.base.BaseBasicBolt;
import org.apache.storm.tuple.Fields;
import org.apache.storm.tuple.Tuple;
import org.apache.storm.tuple.Values;

import java.util.HashMap;
import java.util.Map;

public class WordCountApp {
    public static void main(String[] args) throws Exception {
        int waitTime = 100;
        String topologyName = "Word-Count";
        Config conf = new Config();

        WordCountApp app = new WordCountApp();
        TopologyBuilder builder = new TopologyBuilder();
        builder.setSpout("spout", new RandomSentenceSpout(), 3);
        builder.setBolt("split", new SplitSentence(), 8).shuffleGrouping("spout");
        builder.setBolt("count", new WordCount(), 12).fieldsGrouping("split", new Fields("word"));

        if (args != null && args.length > 0) {
            topologyName = args[0];
            StormSubmitter.submitTopology(topologyName, conf, builder.createTopology());
        } else {
            LocalCluster cluster = new LocalCluster();
            cluster.submitTopology(topologyName, conf, builder.createTopology());
            Thread.sleep(1000 * waitTime);
            cluster.killTopology(topologyName);
            cluster.shutdown();
        }
    }

    public static class SplitSentence  implements IRichBolt {

        private OutputCollector collector = null;
        @Override
        public void declareOutputFields(OutputFieldsDeclarer declarer) {
            declarer.declare(new Fields("word"));
        }

        @Override
        public Map<String, Object> getComponentConfiguration() {
            return null;
        }

        @Override
        public void prepare(Map<String, Object> topoConf, TopologyContext context, OutputCollector collector) {
            this.collector = collector;
        }

        @Override
        public void execute(Tuple input) {
            String sentence = input.getStringByField("word");
            String[]  words = sentence.split(" ");
            for(String word: words) {
                this.collector.emit(new Values(word));
            }
        }
        @Override
        public void cleanup() {
        }
    }

    public static class WordCount extends BaseBasicBolt {
        Map<String, Integer> counts = new HashMap<String, Integer>();

        @Override
        public void execute(Tuple tuple, BasicOutputCollector collector) {
            String word = tuple.getString(0);
            Integer count = counts.get(word);
            if (count == null) {
                count = 0;
            }
            count++;
            counts.put(word, count);

            System.out.println("-----------------------Count Content-----------------------");
            for(String key:counts.keySet()) {
                System.out.println("key: " + key + " -> " + "count: " + counts.get(key));
            }
            System.out.println("-----------------------Content   end-----------------------");
            collector.emit(new Values(word, count));
        }

        @Override
        public void declareOutputFields(OutputFieldsDeclarer declarer) {
            declarer.declare(new Fields("word", "count"));
        }
    }
}
