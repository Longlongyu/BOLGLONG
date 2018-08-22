package com.longlongyu.Info;

import java.util.Date;

public class CommentInfo {
	private int id;   // 评论编号
	private int u_id; // 用户评论编号
	private int p_id; // 评论所在的文章编号
	private String comment = ""; //评论的内容
	private Date c_date;  //评论发表的时间
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

	public Date getCommentDate() {
		return c_date;
	}
	
	public void setCommentDate(Date date) {
		this.c_date = date;
	}
}
