package com.naxsoft.lunchinhell;

import java.net.URI;
import java.net.URISyntaxException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

import static java.lang.System.getenv;

public class Database {
    private final String urlLocal = "jdbc:postgresql://192.168.2.24/d388rk93lku2h2?user=zthxnmqipqknci&password=b8mZWD3Kmh81s1rB0tNXore241&currentSchema=lunch";
//    private final String urlHeroku = "jdbc:postgres://rzubbocoohgkld:nJ5mVB_6m14vS1AX-thkABS2yj@ec2-23-21-140-156.compute-1.amazonaws.com:5432/d5ij42q9ivnn0r";
    public Connection getConnection() throws SQLException, URISyntaxException {
        if ((getenv("localPostgres") == null)) {
            URI dbUri = new URI(System.getenv("DATABASE_URL"));

            String username = dbUri.getUserInfo().split(":")[0];
            String password = dbUri.getUserInfo().split(":")[1];
            String dbUrl = "jdbc:postgresql://" + dbUri.getHost() + ':' + dbUri.getPort() + dbUri.getPath();

            return DriverManager.getConnection(dbUrl, username, password);

        } else {
            return  DriverManager.getConnection(urlLocal);
        }
    }
}
