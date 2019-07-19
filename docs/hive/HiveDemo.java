import java.sql.*;

public class HiveDemo {
    public static void main(String[] args) {
        try {
            Connection connection = null;
            String driverName = "org.apache.hive.jdbc.HiveDriver";
            Class.forName(driverName);
            // arg1: connect url, arg2: username, arg3: password
            connection = DriverManager.getConnection("jdbc:hive2://master:10000/default", "root", "password");
            Statement statement = connection.createStatement();
            ResultSet resultSet = null;
            String sql = "select * from sogou_data1";
            System.out.println("Now running: " + sql);
            resultSet = statement.executeQuery(sql);
            while(resultSet.next()) {
                System.out.println(resultSet.getString(1) + '\t'
                        + resultSet.getString(2) + '\t'
                        + resultSet.getString(3) + '\t'
                        + resultSet.getString(4) + '\t'
                        + resultSet.getString(5) + '\t'
                );
            }
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
