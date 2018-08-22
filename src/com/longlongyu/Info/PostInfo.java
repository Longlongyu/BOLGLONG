package com.longlongyu.Info;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

public class PostInfo {
	private int id;   // 文章的编号
	private int u_id; // 用户的编号
	private String title = "";   // 文章的标题
	private String content = ""; // 文章的内容
	private Date createdate;     // 文章的创建日期
	private List<String> tags = new ArrayList<>();  // 文章的tag数组

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getAuthorId() {
		return u_id;
	}

	public void setAuthorId(int id) {
		this.u_id = id;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public Date getCreatedate() {
		return createdate;
	}

	public void setCreatedate(Date createdate) {
		this.createdate = createdate;
	}
	
	public List<String> getTagsList() {
		return tags;
	}
	
	public void pushTagsList(String tag) {
		this.tags.add(tag);
	}
	public void setTagsList(List<String> tags) {
		this.tags = tags;
	}
}
