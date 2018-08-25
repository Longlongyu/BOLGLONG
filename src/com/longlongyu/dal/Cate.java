package com.longlongyu.dal;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.longlongyu.Info.CateInfo;
import com.longlongyu.data.Conn;

public class Cate {
	Conn conn = new Conn();
	
	/**
	 * 获得所有分类
	 * 
	 * @return list
	 * @throws SQLException
	 */
	public List<CateInfo> getCates() throws SQLException {
		List<CateInfo> list = new ArrayList<CateInfo>();
		String sql = "select * from categories";
		ResultSet rs = conn.executeQuery(sql);
		while (rs.next()) {
			CateInfo info = new CateInfo();
			info.setCateId(rs.getInt("cate"));
			info.setCateName(rs.getString("cate_name"));
			list.add(info);
		}
		conn.close();
		return list;
	}
	
	/**
	 * 获得分类名
	 * 
	 * @param cate
	 * @return cate_name
	 * @throws SQLException
	 */
	public String getCateName(int cate) throws SQLException {
		String result = "";
 		String sql = "select * from categories where cate=" + cate;
		ResultSet rs = conn.executeQuery(sql);
		while (rs.next()) {
			result = rs.getString("cate_name");
		}
		conn.close();
		return result;
	}
}
