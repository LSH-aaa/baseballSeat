package util;

import java.sql.*;

public class Manager {
    // DB 접속정보 설정
    public static Connection getConnection() throws ClassNotFoundException, SQLException {
        Connection conn = null;

        String url = "jdbc:mysql://localhost:3306/baseballseat";
        String user = "root";
        String password = "1234";

        Class.forName("com.mysql.cj.jdbc.Driver");
        conn = DriverManager.getConnection(url, user, password);

        return conn;
    }

    // select를 수행한 후 리소스 해제를 위한 메서드
    // excuteQuery() - ReseltSet
    public static void close(Connection conn, Statement stmt, ResultSet rs) {
        try {
            rs.close();
            stmt.close();
            conn.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    // DML(insert, update, delete)을 수행한 후 리소스 해제를 위한 메서드
    // executeUpdate() - int   // 매개변수 갯수가 달라서 오버로딩 성립
    public static void close(Connection conn, Statement stmt) {
        try {
            stmt.close();
            conn.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}