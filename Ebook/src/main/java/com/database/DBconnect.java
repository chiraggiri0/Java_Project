package com.database;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBconnect {

	private static Connection conn;
	
	public static Connection getconn() {
	
		try {
		Class.forName("com.mysql.cj.jdbc.Driver");
			conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/ebook","root", "root");
			System.out.println("database connected...");
		
		} catch (Exception e) {
		System.out.println("database not onnect"+e);
		
		}
		
		
		return conn;
	}
}
