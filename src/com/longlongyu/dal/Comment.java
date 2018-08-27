package com.longlongyu.dal;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.longlongyu.Info.CommentInfo;
import com.longlongyu.data.Conn;

public class Comment {
	Conn conn = new Conn();
	
	/**
	 * ���ĳ���µ���������
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
	 * ���ĳ�����µ����в�������
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
	 * ���۲������
	 * 
	 * @param info
	 * @return
	 */
	public int insert(CommentInfo info) {
		String sql = "insert into comment(u_id,p_id,c_date,comment) values";
		sql = sql + "(" + info.getUserId() + ",'" + info.getPostId() + "',now(),'" + info.getComment() + "')";
		int result = 0;
		result = conn.executeUpdate(sql);
		conn.close();
		return result;
	}

	/**
	 * �����޸�
	 * 
	 * @param info
	 * @return
	 */
	public int update(CommentInfo info) {
		String sql = "update comment set u_id='" + info.getUserId() + "',comment='"
					+ info.getComment() + "' " + " where p_id=" + info.getPostId() + "";
		int result = 0;
		System.out.println(sql);
		result = conn.executeUpdate(sql);
		conn.close();
		return result;
	}

	/**
	 * ����ɾ��
	 * 
	 * @param id
	 * @return
	 */
	public int delete(int id) {
		String sql = "delete from comment where c_id=" + id + "";
		int result = 0;
		result = conn.executeUpdate(sql);
		conn.close();
		return result;
	}
}
