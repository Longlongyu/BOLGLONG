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
	 * ��ȡ�û��б�
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
	 * �жϵ�ǰ��½�û��Ƿ����
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
	 * ��ȡ�����û���Ϣ
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
	 * �ж�ע���û��Ƿ��Ѿ�����
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
	 * �û�����
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
	 * ��¼�û���¼ʱ��<br>
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
	 * �û��޸�
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
	 * ɾ���û�
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
