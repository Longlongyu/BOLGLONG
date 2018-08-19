package com.longlongyu.dal;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.longlongyu.Info.Userinfo;
import com.longlongyu.data.Conn;

public class User {
	Conn conn = new Conn();

	/**
	 * 获取用户列表
	 * 
	 * @return
	 * @throws SQLException
	 */
	public List<Userinfo> getList() throws SQLException {
		List<Userinfo> list = new ArrayList<Userinfo>();
		String sql = "select * from user order by u_id asc";
		ResultSet rs = conn.executeQuery(sql);
		while (rs.next()) {
			Userinfo info = new Userinfo();
			info.setUserid(rs.getInt("u_id"));
			info.setUsername(rs.getString("u_name"));
			info.setPassword(rs.getString("password"));
			info.setEmail(rs.getString("email"));
			info.setPower(rs.getInt("power"));
			list.add(info);
		}
		conn.close();
		return list;
	}

	/**
	 * 判断当前登陆用户是否存在
	 * 
	 * @param username
	 * @param password
	 * @return
	 * @throws SQLException
	 */
	public boolean isExist(String username, String password) throws SQLException {
		boolean result = false;
		String sql = "select * from user where u_name='" + username + "'and password='" + password + "'";

		ResultSet rs = conn.executeQuery(sql);
		if (rs.next()) {
			result = true;
		}
		conn.close();
		return result;
	}

	/**
	 * 获取单个用户信息
	 * 
	 * @param username
	 * @return
	 * @throws SQLException
	 */
	public Userinfo getUserinfo(String username) throws SQLException {
		Userinfo info = new Userinfo();
		String sql = "select * from user where u_name='" + username + "'";
		ResultSet rs = conn.executeQuery(sql);
		if (rs.next()) {
			info.setUserid(rs.getInt("u_id"));
			info.setUsername(rs.getString("u_name"));
			info.setPassword(rs.getString("password"));
			info.setEmail(rs.getString("email"));
			info.setPower(rs.getInt("power"));
		}
		conn.close();
		return info;
	}

	/**
	 * 判断注册用户是否已经存在
	 * 
	 * @param username
	 * @return
	 * @throws SQLException
	 */
	public boolean isExistUsersInfo(String username) throws SQLException {
		boolean result = false;
		String sql = "select * from user where u_name='" + username + "'";
		ResultSet rs = conn.executeQuery(sql);
		if (rs.next()) {
			result = true;
		}
		conn.close();
		return result;
	}

	/**
	 * 用户插入
	 * 
	 * @param info
	 * @return
	 */
	public int insert(Userinfo info) throws SQLException {
		String sql = "insert into user(u_name,password,email) values";
		sql = sql + "('" + info.getUsername() + "','" + info.getPassword() + "','" + info.getEmail() + "')";
		int result = 0;
		result = conn.executeUpdate(sql);
		conn.close();
		return result;
	}
	
	/**
	 * 记录用户登录时间<br>
	 * @param username
	 * @return
	 */
	public int updateTime(String username) {
		String sql = "update user set u_time=now() where u_name='" + username + "'";
		int result = 0;
		result = conn.executeUpdate(sql);
		conn.close();
		return result;
	}
	
	/**
	 * 用户修改
	 * 
	 * @param info
	 * @return
	 */
	public int update(Userinfo info) {
		String sql = "update user set password='" + info.getPassword() + "',email='" + info.getEmail() + "',power='"
		    + info.getPower() + "'" + "where u_name='" + info.getUsername() + "'";
		int result = 0;
		result = conn.executeUpdate(sql);
		conn.close();
		return result;
	}

	/**
	 * 删除用户
	 * 
	 * @param username
	 * @return
	 */
	public int delete(String username) {
		String sql = "delete from user where u_name='" + username + "'";
		int result = 0;
		result = conn.executeUpdate(sql);
		conn.close();
		return result;
	}
}
