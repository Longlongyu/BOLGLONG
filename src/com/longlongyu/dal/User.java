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
	 * ��ȡ�û��б�
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
	 * ��ȡ�û�Ȩ��
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
	 * �жϵ�ǰ��½�û�
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
	 * ��ȡ�����û���Ϣ
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
	 * ��ȡ�û���
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
	 * ��ȡ�û�id
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
	 * ��¼�û���¼ʱ��<br>
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
	 * �û��޸�
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
	 * ɾ���û�
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
