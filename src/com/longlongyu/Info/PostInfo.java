package com.longlongyu.Info;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

public class PostInfo {
	private int id;
	private int u_id;
	private String title = "";
	private String content = "";
	private Date createdate;
	private List<String> tags = new ArrayList<>();

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
