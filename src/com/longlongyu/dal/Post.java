package com.longlongyu.dal;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.longlongyu.Info.PostInfo;
import com.longlongyu.data.Conn;
import com.longlongyu.data.DataValidator;

public class Post {
	Conn conn = new Conn();

	/**
	 * 获取博文列表
	 * 
	 * @param keyword
	 * @return
	 * @throws SQLException
	 */
	public List<PostInfo> getList(String keyword) throws SQLException {
		List<PostInfo> list = new ArrayList<PostInfo>();

		String sql = "select * from post";
		if (DataValidator.isNullOrEmpty(keyword)) {
			sql = sql + " order by p_id desc";
		} else {
			sql = sql + " where title like '%" + keyword + "%' order by p_id desc";
		}
		ResultSet rs = conn.executeQuery(sql);
		while (rs.next()) {
			PostInfo info = new PostInfo();
			info.setId(rs.getInt("p_id"));
			info.setAuthorId(rs.getInt("u_id"));
			info.setTitle(rs.getString("title"));
			info.setContent(rs.getString("content"));
			info.setCreatedate(rs.getDate("createdate"));
			list.add(info);
		}
		conn.close();
		return list;
	}

	/**
	 * 获得某标签下的所有博文列表
	 * 
	 * @param tag
	 * @return
	 * @throws SQLException
	 */
	public List<PostInfo> getListByTag(String tag) throws SQLException {
		List<PostInfo> list = new ArrayList<PostInfo>();
		String sql = "select tag from post,tag where post.p_id=tag.p_id order by p_id desc";
		ResultSet rs = conn.executeQuery(sql);
		while (rs.next()) {
			PostInfo info = new PostInfo();
			info.setId(rs.getInt("p_id"));
			info.setAuthorId(rs.getInt("u_id"));
			info.setTitle(rs.getString("title"));
			info.setContent(rs.getString("content"));
			info.setCreatedate(rs.getDate("createdate"));
			list.add(info);
		}
		conn.close();
		return list;
	}

	/**
	 * 获得单个博文的所有标签
	 * 
	 * @param id
	 * @return
	 * @throws SQLException
	 */
	public List<PostInfo> getTagsByPost(int id) throws SQLException {
		List<PostInfo> list = new ArrayList<PostInfo>();
		String sql = "select tag from tag " + " where p_id='" + id + "'";
		ResultSet rs = conn.executeQuery(sql);
		PostInfo info = getPostInfo(id);
		while (rs.next()) {
			info.pushTagsList(rs.getString("tag"));
		}
		list.add(info);
		conn.close();
		return list;
	}

	/**
	 * 获取单条博文
	 * 
	 * @param id
	 * @return
	 * @throws SQLException
	 */
	public PostInfo getPostInfo(int id) throws SQLException {
		PostInfo info = new PostInfo();
		String sql = "select * from post where p_id=" + id;
		ResultSet rs = conn.executeQuery(sql);
		while (rs.next()) {
			info.setId(rs.getInt("p_id"));
			info.setAuthorId(rs.getInt("u_id"));
			info.setTitle(rs.getString("title"));
			info.setContent(rs.getString("content"));
			info.setCreatedate(rs.getDate("createdate"));
		}
		conn.close();
		return info;
	}
	
	/**
	 * 是否有某条博文
	 * 
	 * @param id
	 * @return
	 * @throws SQLException
	 */
	public boolean hasPostInfo(int id) throws SQLException {
		boolean result = false;
		String sql = "select * from post where p_id=" + id;
		ResultSet rs = conn.executeQuery(sql);
		while (rs.next()) {
			result = true;
		}
		conn.close();
		return result;
	}
	
	/**
	 * 博文插入操作
	 * 
	 * @param info
	 * @return
	 */
	public int insert(PostInfo info) {
		String sql = "insert into post(u_id,title,createdate,content) values";
		sql = sql + "(" + info.getAuthorId() + ",'" + info.getTitle() + "',now(),'" + info.getContent() + "')";
		int result = 0;
		System.out.println(sql);
		result = conn.executeUpdate(sql);
		conn.close();
		return result;
	}

	/**
	 * 博文修改
	 * 
	 * @param info
	 * @return
	 */
	public int update(PostInfo info) {
		String sql = "update post set " + " title='" + info.getTitle() + "',content='"
					+ info.getContent() + "' " + " where p_id=" + info.getId() + "";
		int result = 0;
		System.out.println(sql);
		result = conn.executeUpdate(sql);
		conn.close();
		return result;
	}

	/**
	 * 博文删除
	 * 
	 * @param id
	 * @return
	 */
	public int delete(int id) {
		String sql = "delete from post where p_id=" + id + "";
		int result = 0;
		result = conn.executeUpdate(sql);
		conn.close();
		return result;
	}
}
