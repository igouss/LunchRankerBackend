package com.naxsoft.lunchinhell;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class Database {
    private final String url = "jdbc:postgresql://192.168.2.24/d388rk93lku2h2?user=zthxnmqipqknci&password=b8mZWD3Kmh81s1rB0tNXore241&currentSchema=lunch";
    public Connection getConnection() throws SQLException {
        Connection conn = DriverManager.getConnection(url);
        return conn;
    }
}
