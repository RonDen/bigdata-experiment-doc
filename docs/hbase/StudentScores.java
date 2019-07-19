import org.apache.hadoop.conf.Configuration;
import org.apache.hadoop.hbase.HBaseConfiguration;
import org.apache.hadoop.hbase.HColumnDescriptor;
import org.apache.hadoop.hbase.HTableDescriptor;
import org.apache.hadoop.hbase.TableName;
import org.apache.hadoop.hbase.client.*;

import java.io.IOException;
import java.util.Arrays;

public class StudentScores {
    private static Configuration configuration;
    private static Connection connection;
    private static Admin admin;

    public static void main(String[] args) throws IOException {
        String tableName = "scores";
        String[] colFamily = {"grade","score"};

        init();
        createTable(tableName, colFamily);
        insertData(tableName, "dandan", "grade", "","6");
        insertData(tableName, "dandan", "score", "english", "95");
        insertData(tableName, "dandan", "score", "math", "100");
        insertData(tableName, "dandan", "score", "chinese", "92");

        insertData(tableName, "sansan", "grade", "","6");
        insertData(tableName, "sansan", "score", "english", "87");
        insertData(tableName, "sansan", "score", "math", "95");
        insertData(tableName, "sansan", "score", "chinese", "98");

        getData(tableName, "dandan", "score", "math");
        getData(tableName, "sansan", "score", "english");
        getData(tableName, "sansan", "grade", "");

        close();
    }

    /**
     * init the connection
     */
    public static void init() {
        configuration = HBaseConfiguration.create();
        configuration.set("hbase.rootdir", "hdfs://ldcluster:8020/hbase");

        try {
            connection = ConnectionFactory.createConnection(configuration);
            admin = connection.getAdmin();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    /**
     * close the connection
     */
    public static void close() {
        try {
            if (admin != null) {
                admin.close();
            }
            if (connection != null) {
                connection.close();
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    /**
     * create table
     */
    public static void createTable(String myTableName, String[] colFamily) throws IOException {
        TableName tableName = TableName.valueOf(myTableName);
        if (admin.tableExists(tableName)) {
            System.out.println("The " + myTableName + "exists!");
        } else {
            HTableDescriptor hTableDescriptor = new HTableDescriptor(tableName);
            for (String str :
                    colFamily) {
                HColumnDescriptor columnDescriptor = new HColumnDescriptor(str);
                hTableDescriptor.addFamily(columnDescriptor);
            }
            admin.createTable(hTableDescriptor);
        }
    }

    /**
     * insert data into table
     */
    public static void insertData(String tableName, String rowKey, String colFamily, String col, String val) throws IOException {
        Table table = connection.getTable(TableName.valueOf(tableName));
        Put put = new Put(rowKey.getBytes());
        put.addColumn(colFamily.getBytes(), col.getBytes(), val.getBytes());
        table.put(put);
        table.close();
    }

    /**
     * get data from studnet score table
     */
    public static void getData(String tableName, String rowKey, String colFamily, String col) throws IOException {
        Table table = connection.getTable(TableName.valueOf(tableName));
        Get get = new Get(rowKey.getBytes());
        get.addColumn(colFamily.getBytes(), col.getBytes());
        Result result = table.get(get);
        System.out.println(new String(result.getValue(colFamily.getBytes(), col.getBytes())));
        table.close();
    }
}
