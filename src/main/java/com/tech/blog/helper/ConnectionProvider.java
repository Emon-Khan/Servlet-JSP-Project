package com.tech.blog.helper;

import java.sql.*;

public class ConnectionProvider {
	private static Connection con;

	public static Connection getConnection() {
		try {
			if (con == null) {
				Class.forName("com.mysql.cj.jdbc.Driver");
				String url = "jdbc:mysql://localhost:3306/techblog";
				String username = "root";
				String password = "147258";
				con = DriverManager.getConnection(url, username, password);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return con;
	}

}
