package com.longlongyu.Info;


import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

public class PostInfo {
	private int id;   // 文章的编号
	private int u_id; // 用户的编号
	private String title = "";   // 文章的标题
	private String content = ""; // 文章的内容
	private Timestamp createdate;     // 文章的创建日期
	private List<String> tags = new ArrayList<>();  // 文章的tag数组
	private int cate;
	private int count;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}
	
	public int getCate() {
		return cate;
	}

	public void setCate(int cate) {
		this.cate = cate;
	}

	public int getAuthorId() {
		return u_id;
	}

	public void setAuthorId(int id) {
		this.u_id = id;
	}
	
	public int getCount() {
		return count;
	}

	public void setCount(int count) {
		this.count = count;
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

	public Timestamp getCreatedate() {
		return createdate;
	}
	
	public String getTime() {
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String dateString = format.format(createdate);
		return dateString;
	}

	public void setCreatedate(Timestamp createdate) {
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
