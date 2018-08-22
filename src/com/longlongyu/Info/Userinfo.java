package com.longlongyu.Info;

public class Userinfo {
	private int userid;             // 用户的编号
	private String username = "";   // 用户的名字
	private String password = "";   // 用户的密码
	private String email = "";      // 用户的邮箱
	private int power;              // 用户的权限

	public int getUserid() {
		return userid;
	}
	
	public void setUserid(int userid) {
		this.userid = userid;
	}
	
	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public int getPower() {
		return power;
	}

	public void setPower(int power) {
		this.power = power;
	}
}
