package com.company.bbs;

import java.sql.Connection;
import java.sql.DriverManager;

import org.junit.Test;

public class MySQLConnectionTest {

	private static final String DRIVER = "net.sf.log4jdbc.sql.jdbcapi.DriverSpy";
	private static final String URL = "jdbc:log4jdbc:mysql://localhost:3306/mydb?useUnicode=yes&characterEncoding=UTF-8&serverTimezone=UTC&useSSL=false";
	private static final String USER = "root";
	private static final String PW = "mysql";
	
	@Test
	public void testConnection() throws Exception {		
		Class.forName(DRIVER);		
		try(Connection con = DriverManager.getConnection(URL, USER, PW)){
			System.out.println("Database connection successful");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
