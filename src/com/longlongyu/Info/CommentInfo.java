package com.longlongyu.Info;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;

public class CommentInfo {
	private int id;   // ���۱��
	private int u_id; // �û����۱��
	private int p_id; // �������ڵ����±��
	private String comment = ""; //���۵�����
	private Timestamp c_date;  //���۷����ʱ��
	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getUserId() {
		return u_id;
	}

	public void setUserId(int id) {
		this.u_id = id;
	}
	
	public int getPostId() {
		return p_id;
	}

	public void setPostId(int id) {
		this.p_id = id;
	}

	public String getComment() {
		return comment;
	}

	public void setComment(String comment) {
		this.comment = comment;
	}
	
	public String getCommentDate() {
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String dateString = format.format(c_date);
		return dateString;
	}
	
	public void setCommentDate(Timestamp date) {
		this.c_date = date;
	}
}
