
package context;


import java.sql.*;



public class DBContext {
    private Connection connection;
    private String url = "jdbc:mysql://localhost:3306/kho";
    private String user = "root";
    private String password = "abc123";

    public DBContext() {
        try {
            Class.forName("com.mysql.jdbc.Driver");
            connection = DriverManager.getConnection(url, user, password);
            System.out.println("Connected to MySQL database.");
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
        }
    }

    public Connection getConnection() {
        return connection;
    }
}







 