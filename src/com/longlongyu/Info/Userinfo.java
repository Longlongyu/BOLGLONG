package com.longlongyu.Info;

public class Userinfo {
	private int userid;             // �û��ı��
	private String username = "";   // �û�������
	private String password = "";   // �û�������
	private String email = "";      // �û�������
	private int power;              // �û���Ȩ��

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
