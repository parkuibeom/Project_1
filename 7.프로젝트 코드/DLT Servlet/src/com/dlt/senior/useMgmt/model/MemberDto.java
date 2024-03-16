package com.dlt.senior.useMgmt.model;

import java.util.Date;

public class MemberDto {
	private String userId;
	private String pw;
	private String phone;
	private String name;
	private String email;
	private Date date;

	public String getUserId() {
		return userId;
	}
	public String getPw() {
		return pw;
	}
	public String getName() {
		return name;
	}
	public String getEmail() {
		return email;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public void setPw(String pw) {
		this.pw = pw;
	}
	public void setName(String name) {
		this.name = name;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	
	public Date getDate() {
		return date;
	}

	public void setDate(Date date) {
		this.date = date;
	}

	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}

	

}
