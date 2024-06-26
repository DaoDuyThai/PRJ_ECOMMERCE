package dal;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBContext {
    
    public Connection getConnection() throws Exception {
        String url = "jdbc:sqlserver://" + serverName + ":" + portNumber + "\\" + instance + ";databaseName=" + dbName;
        if (instance == null || instance.trim().isEmpty())
            url = "jdbc:sqlserver://" + serverName + ":" + portNumber + ";databaseName=" + dbName;
        Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
        return DriverManager.getConnection(url, userID, password);
    }   
    
    private final String serverName = "localhost";
    private final String dbName = "PRJ_ECOMMERCE";
    private final String portNumber = "1433";
    private final String instance = ""; // LEAVE THIS ONE EMPTY IF YOUR SQL IS A SINGLE INSTANCE
    private final String userID = "sa";
    private final String password = "123";

    public static void main(String[] args) {
        try {
            Connection conn = new DBContext().getConnection();
            if (conn != null) {
                System.out.println("Connection established successfully!");
                conn.close();
            } else {
                System.out.println("Failed to establish connection!");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}