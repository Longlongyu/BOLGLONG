package com.longlongyu.add;

import java.util.ArrayList;
import java.util.List;

import com.longlongyu.Info.PostInfo;
import com.longlongyu.dal.Comment;
import com.longlongyu.dal.Post;
import com.longlongyu.dal.User;

public class BlogBean implements java.io.Serializable {
	private User user = new User();
	private Post post = new Post();
	private Comment comm = new Comment();
	private PostInfo postinfo = new PostInfo();
	private List<PostInfo> postlist = new ArrayList<>();
	private int currpage = 1;
	
	public BlogBean() {
		
	}
	
	public User getUser() {
		return user;
	}
	
	public void setUser(User user) {
		this.user = user;
	}
	
	public Post getPost() {
		return post;
	}
	
	public void setPost(Post post) {
		this.post = post;
	}
	
	public Comment getComment() {
		return comm;
	}
	
	public void setComment(Comment comm) {
		this.comm = comm;
	}
	
	public PostInfo getPostInfo() {
		return postinfo;
	}
	
	public void setPostInfo(PostInfo postinfo) {
		this.postinfo = postinfo;
	}
	
	public List<PostInfo> getPostInfoList() {
		return postlist;
	}
	
	public void setPostInfoList(List<PostInfo> postlist) {
		this.postlist = postlist;
	}
	
	public int getCurrPage() {
		return currpage;
	}
	
	public void setCurrPage(int currpage) {
		this.currpage = currpage;
	}
}
