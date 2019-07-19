package hivetest;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class HiveJDBC {
    private static Connection conn = null;

    public static void main(String args[]) throws Exception {
        try {
            Class.forName("org.apache.hive.jdbc.HiveDriver");
            conn = DriverManager.getConnection("jdbc:hive2://master:10000/hive", "root", "password");
            Statement st = conn.createStatement();
            String sql1 = "select * from sogou-data1";
            ResultSet rs = st.executeQuery(sql1);
            while (rs.next()) {
                System.out.println(rs.getString(1) + "     " + rs.getString(2));
            }
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}