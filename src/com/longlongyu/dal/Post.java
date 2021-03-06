package com.longlongyu.dal;

import java.sql.PreparedStatement;
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
			sql = sql + " order by createdate desc";
		} else {
			sql = sql + " where title like '%" + keyword + "%' order by createdate desc";
		}
		ResultSet rs = conn.executeQuery(sql);
		while (rs.next()) {
			PostInfo info = new PostInfo();
			info.setId(rs.getInt("p_id"));
			info.setAuthorId(rs.getInt("u_id"));
			info.setTitle(rs.getString("title"));
			info.setContent(rs.getString("content"));
			info.setCreatedate(rs.getTimestamp("createdate"));
			info.setCate(rs.getInt("cate"));
			info.setCount(rs.getInt("pcount"));
			list.add(info);
		}
		conn.close();
		return list;
	}

	/**
	 * 获取可用的博文id
	 * 
	 * @return p_id
	 * @throws SQLException
	 */
	public int getNullPostId() throws SQLException {
		int result = 1;

		String sql = "select * from post";
		ResultSet rs = conn.executeQuery(sql);
		while (rs.next()) {
			if (result != rs.getInt("p_id")) {
				break;
			}
			result++;
		}
		conn.close();
		return result;
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
		String sql = "select post.p_id,u_id,title,content,createdate,cate,pcount from post,tag where post.p_id=tag.p_id order by createdate desc";
		ResultSet rs = conn.executeQuery(sql);
		while (rs.next()) {
			PostInfo info = new PostInfo();
			info.setId(rs.getInt("p_id"));
			info.setAuthorId(rs.getInt("u_id"));
			info.setTitle(rs.getString("title"));
			info.setContent(rs.getString("content"));
			info.setCreatedate(rs.getTimestamp("createdate"));
			info.setCate(rs.getInt("cate"));
			info.setCount(rs.getInt("pcount"));
			list.add(info);
		}
		conn.close();
		return list;
	}

	/**
	 * 获得某分类下的所有博文列表
	 * 
	 * @param tag
	 * @return
	 * @throws SQLException
	 */
	public List<PostInfo> getListByCate(int cate) throws SQLException {
		List<PostInfo> list = new ArrayList<PostInfo>();
		String sql = "select * from post where cate=" + cate
		    + " order by createdate desc";
		ResultSet rs = conn.executeQuery(sql);
		while (rs.next()) {
			PostInfo info = new PostInfo();
			info.setId(rs.getInt("p_id"));
			info.setAuthorId(rs.getInt("u_id"));
			info.setTitle(rs.getString("title"));
			info.setContent(rs.getString("content"));
			info.setCreatedate(rs.getTimestamp("createdate"));
			info.setCate(rs.getInt("cate"));
			info.setCount(rs.getInt("pcount"));
			list.add(info);
		}
		conn.close();
		return list;
	}
	
	
	/**
	 * 获得某分类下的所有博文数量
	 * 
	 * @param post number
	 * @return
	 * @throws SQLException
	 */
	public int getPostNum() throws SQLException {
		int result = 0;
		String sql = "select count(p_id) result from post";
		ResultSet rs = conn.executeQuery(sql);
		while (rs.next()) {
			result = rs.getInt("result");
		}
		conn.close();
		return result;
	}
	
	/**
	 * 获得某分类下的所有博文数量
	 * 
	 * @param post number
	 * @return
	 * @throws SQLException
	 */
	public int getPostNumByCate(int cate) throws SQLException {
		int result = 0;
		String sql = "select count(p_id) result from post where cate=" + cate;
		ResultSet rs = conn.executeQuery(sql);
		while (rs.next()) {
			result = rs.getInt("result");
		}
		conn.close();
		return result;
	}

	/**
	 * 获得某作者的所有博文列表
	 * 
	 * @param tag
	 * @return
	 * @throws SQLException
	 */
	public List<PostInfo> getListByAuthor(int id) throws SQLException {
		List<PostInfo> list = new ArrayList<PostInfo>();
		String sql = "select * from post where u_id=" + id + " order by createdate desc";
		ResultSet rs = conn.executeQuery(sql);
		while (rs.next()) {
			PostInfo info = new PostInfo();
			info.setId(rs.getInt("p_id"));
			info.setAuthorId(rs.getInt("u_id"));
			info.setTitle(rs.getString("title"));
			info.setContent(rs.getString("content"));
			info.setCreatedate(rs.getTimestamp("createdate"));
			info.setCate(rs.getInt("cate"));
			info.setCount(rs.getInt("pcount"));
			list.add(info);
		}
		conn.close();
		return list;
	}

	/**
	 * 获得某作者的某类别博文列表
	 * 
	 * @param tag
	 * @return
	 * @throws SQLException
	 */
	public List<PostInfo> getListByAuthorAndCate(int id, int cate) throws SQLException {
		List<PostInfo> list = new ArrayList<PostInfo>();
		String sql = "select * from post where u_id=" + id + " and cate=" + cate + " order by createdate desc";
		ResultSet rs = conn.executeQuery(sql);
		while (rs.next()) {
			PostInfo info = new PostInfo();
			info.setId(rs.getInt("p_id"));
			info.setAuthorId(rs.getInt("u_id"));
			info.setTitle(rs.getString("title"));
			info.setContent(rs.getString("content"));
			info.setCreatedate(rs.getTimestamp("createdate"));
			info.setCate(rs.getInt("cate"));
			info.setCount(rs.getInt("pcount"));
			list.add(info);
		}
		conn.close();
		return list;
	}
	
	/**
	 * 获得某作者的某分类下的所有博文数量
	 * 
	 * @param post number
	 * @return
	 * @throws SQLException
	 */
	public int getPostNumByAuthor(int id) throws SQLException {
		int result = 0;
		String sql = "select count(p_id) result from post where u_id=" + id;
		ResultSet rs = conn.executeQuery(sql);
		while (rs.next()) {
			result = rs.getInt("result");
		}
		conn.close();
		return result;
	}
	
	/**
	 * 获得某作者的某分类下的所有博文数量
	 * 
	 * @param post number
	 * @return
	 * @throws SQLException
	 */
	public int getPostNumByAuthorAndCate(int id, int cate) throws SQLException {
		int result = 0;
		String sql = "select count(p_id) result from post where u_id=" + id + " and cate=" + cate;
		ResultSet rs = conn.executeQuery(sql);
		while (rs.next()) {
			result = rs.getInt("result");
		}
		conn.close();
		return result;
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
			info.setCreatedate(rs.getTimestamp("createdate"));
			info.setCate(rs.getInt("cate"));
			info.setCount(rs.getInt("pcount"));
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
	public void insert(PostInfo info) throws SQLException {
		String sql = "insert into post(u_id,title,createdate,content,cate) values(?,?,now(),?,?)";
		PreparedStatement ps = conn.usePreparedStatement(sql);
		ps.setInt(1, info.getAuthorId());
		ps.setString(2, info.getTitle());
		ps.setString(3, info.getContent());
		ps.setInt(4, info.getCate());
		ps.execute();
		conn.close();
	}

	/**
	 * 博文插入操作
	 * 
	 * @param info
	 * @return
	 */
	public void insert(int id, PostInfo info) throws SQLException {
		String sql = "insert into post(p_id,u_id,title,createdate,content,cate) values(?,?,?,now(),?,?)";
		PreparedStatement ps = conn.usePreparedStatement(sql);
		ps.setInt(1, id);
		ps.setInt(2, info.getAuthorId());
		ps.setString(3, info.getTitle());
		ps.setString(4, info.getContent());
		ps.setInt(5, info.getCate());
		ps.execute();
		conn.close();
	}

	/**
	 * 博文修改
	 * 
	 * @param info
	 * @return
	 */
	public void update(PostInfo info) throws SQLException {
		String sql = "update post set title=?,content=?,cate=? where p_id=?";
		PreparedStatement ps = conn.usePreparedStatement(sql);
		ps.setString(1, info.getTitle());
		ps.setString(2, info.getContent());
		ps.setInt(3, info.getCate());
		ps.setInt(4, info.getId());
		ps.execute();
		conn.close();
	}

	/**
	 * 博文删除
	 * 
	 * @param id
	 * @return
	 */
	public void delete(int id, int u_id) throws SQLException {
		String sql = "delete from post where p_id=? and u_id=?";
		PreparedStatement ps = conn.usePreparedStatement(sql);
		ps.setInt(1, id);
		ps.setInt(2, u_id);
		ps.execute();
		conn.close();
	}
	
	/**
	 * 博文删除
	 * 
	 * @param id
	 * @return
	 */
	public void delete(int id) throws SQLException {
		String sql = "delete from post where p_id=?";
		PreparedStatement ps = conn.usePreparedStatement(sql);
		ps.setInt(1, id);
		ps.execute();
		conn.close();
	}
}
