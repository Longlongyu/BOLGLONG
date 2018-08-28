package com.longlongyu.data;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class Conn {
	Connection conn = null;
	Statement stmt = null;
	ResultSet rs = null;
	
	/**
	 * Conn 的构造函数。加载 JDBC。
	 */
	public Conn() {
		try {
			Class.forName("com.mysql.jdbc.Driver");
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	/**
	 * 查询 sql 数据表
	 * @param sql
	 * @return ResultSet
	 */
	public ResultSet executeQuery(String sql) {
		try {
			conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/blog?serverTimezone=Hongkong",
			    "root", "123456");
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return rs;
	}
	
	/**
	 * 更新 sql 数据表
	 * @param sql
	 * @return 
	 */
	public int executeUpdate(String sql){
		int result=0;
		try {
			conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/blog?serverTimezone=UTC",
			    "root", "123456");
			stmt=conn.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE,ResultSet.CONCUR_READ_ONLY);
			result=stmt.executeUpdate(sql);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			result=0;
		}
		return result;	
	}
	/**
	 * 数据库关闭方法
	 */
	public void close(){
		if(rs!=null)
			try {
				rs.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		if(stmt!=null)
			try {
				stmt.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		if(conn!=null)
			try {
				conn.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
	}
}
