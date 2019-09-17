package com.lms.dbresources;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;


public class DBHandler {
	
	static{
		try {
			Class.forName("com.mysql.jdbc.Driver");
			System.out.println("Driver Loaded");
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
	
	public static Connection getConnection(){
		
		try {
			return DriverManager.getConnection("jdbc:mysql://localhost:3306/lms","root","");
		} catch (SQLException e) {
			
			// TODO Auto-generated catch block
			e.printStackTrace();
			return null;
		}
	}

	public static void main(String[] args) {
		
	}

}
