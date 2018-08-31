package com.longlongyu.dal;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.longlongyu.Info.CommentInfo;
import com.longlongyu.data.Conn;

public class Comment {
	Conn conn = new Conn();
	
	/**
	 * 获得某文章的所有评论
	 * 
	 * @param p_id
	 * @return
	 * @throws SQLException
	 */
	public List<CommentInfo> getCommentByPost(int id) throws SQLException {
		List<CommentInfo> list = new ArrayList<CommentInfo>();
		String sql = "select * from comment where p_id=" + id + " order by c_date desc";
		ResultSet rs = conn.executeQuery(sql);
		while (rs.next()) {
			CommentInfo info = new CommentInfo();
			info.setId(rs.getInt("c_id"));
			info.setUserId(rs.getInt("u_id"));
			info.setPostId(rs.getInt("p_id"));
			info.setComment(rs.getString("comment"));
			info.setCommentDate(rs.getTimestamp("c_date"));
			list.add(info);
		}
		conn.close();
		return list;
	}
	
	/**
	 * 获得某分类下的所有博文数量
	 * 
	 * @param comm number
	 * @return
	 * @throws SQLException
	 */
	public int getCommentNum(int p_id) throws SQLException {
		int result = 0;
		String sql = "select count(p_id) result from comment where p_id=" + p_id;
		ResultSet rs = conn.executeQuery(sql);
		while (rs.next()) {
			result = rs.getInt("result");
		}
		conn.close();
		return result;
	}
	
	/**
	 * 评论插入操作
	 * 
	 * @param info
	 * @return
	 */
	public void insert(CommentInfo info) throws SQLException {
		String sql = "insert into comment(u_id,p_id,c_date,comment) values(?,?,now(),?)";
		PreparedStatement ps = conn.usePreparedStatement(sql);
		ps.setInt(1, info.getUserId());
		ps.setInt(2, info.getPostId());
		ps.setString(3, info.getComment());
		ps.execute();
		conn.close();
	}

	/**
	 * 评论修改
	 * 
	 * @param info
	 * @return
	 */
	public void update(CommentInfo info) throws SQLException {
		String sql = "update comment set u_id=?,comment=? where p_id=?";
		PreparedStatement ps = conn.usePreparedStatement(sql);
		ps.setInt(1, info.getUserId());
		ps.setString(2, info.getComment());
		ps.setInt(3, info.getPostId());
		ps.execute();
		conn.close();
	}

	/**
	 * 评论删除
	 * 
	 * @param id
	 * @return
	 */
	public void delete(int id) throws SQLException {
		String sql = "delete from comment where c_id=?";
		PreparedStatement ps = conn.usePreparedStatement(sql);
		ps.setInt(1, id);
		ps.execute();
		conn.close();
	}
}
