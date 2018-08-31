package com.longlongyu.Info;


import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

public class PostInfo {
	private int id;   // ���µı��
	private int u_id; // �û��ı��
	private String title = "";   // ���µı���
	private String content = ""; // ���µ�����
	private Timestamp createdate;     // ���µĴ�������
	private List<String> tags = new ArrayList<>();  // ���µ�tag����
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
