package com.longlongyu.dal;

import java.sql.PreparedStatement;
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
	 * 获取用户权限
	 * 
	 * @param username
	 * @return
	 * @throws SQLException
	 */
	public int getPower(String username) throws SQLException {
		int result = -1;
		String sql = "select power from user where u_name='" + username + "'";

		ResultSet rs = conn.executeQuery(sql);
		if (rs.next()) {
			result = rs.getInt("power");
		}
		conn.close();
		return result;
	}
	
	/**
	 * 判断当前登陆用户
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
	 * 获取单个用户信息
	 * 
	 * @param id
	 * @return
	 * @throws SQLException
	 */
	public Userinfo getUserinfo(int id) throws SQLException {
		Userinfo info = new Userinfo();
		String sql = "select * from user where u_id='" + id + "'";
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
	 * 获取用户名
	 * 
	 * @param id
	 * @return
	 * @throws SQLException
	 */
	public String getUserName(int id) throws SQLException {
		String result = null;
		String sql = "select u_name from user where u_id='" + id + "'";
		ResultSet rs = conn.executeQuery(sql);
		if (rs.next()) {
			result = rs.getString("u_name");
		}
		conn.close();
		return result;
	}
	
	/**
	 * 获取用户id
	 * 
	 * @param username
	 * @return
	 * @throws SQLException
	 */
	public int getUserId(String username) throws SQLException {
		int result = -1;
		String sql = "select u_id from user where u_name='" + username + "'";
		ResultSet rs = conn.executeQuery(sql);
		if (rs.next()) {
			result = rs.getInt("u_id");
		}
		conn.close();
		return result;
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
	public void insert(Userinfo info) throws SQLException {
		String sql = "insert into user(u_name,password,email) values(?,?,?)";
		PreparedStatement ps = conn.usePreparedStatement(sql);
		ps.setString(1, info.getUsername());
		ps.setString(2, info.getPassword());
		ps.setString(3, info.getEmail());
		ps.execute();
		conn.close();
	}
	
	/**
	 * 记录用户登录时间<br>
	 * @param username
	 * @return
	 */
	public void updateTime(String username) throws SQLException {
		String sql = "update user set u_time=now() where u_name=?";
		PreparedStatement ps = conn.usePreparedStatement(sql);
		ps.setString(1, username);
		ps.execute();
		conn.close();
	}
	
	/**
	 * 用户修改
	 * 
	 * @param info
	 * @return
	 */
	public void update(Userinfo info) throws SQLException {
		String sql = "update user set password=?,email=?,power=? where u_name=?";
		PreparedStatement ps = conn.usePreparedStatement(sql);
		ps.setString(1, info.getPassword());
		ps.setString(2, info.getEmail());
		ps.setInt(3, info.getPower());
		ps.setString(4, info.getUsername());
		ps.execute();
		conn.close();
	}

	/**
	 * 删除用户
	 * 
	 * @param username
	 * @return
	 */
	public void delete(String username) throws SQLException {
		String sql = "delete from user where u_name=?";
		PreparedStatement ps = conn.usePreparedStatement(sql);
		ps.setString(1, username);
		ps.execute();
		conn.close();
	}
}
