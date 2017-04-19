package com.blog.entity;

public class Manager {
	private Integer id;
	private String account;
	private String password;
	private String role;
	private String notice;
	public Manager() {
		super();
	}
	public Manager(String account, String password, String role, String notice) {
		super();
		this.account = account;
		this.password = password;
		this.role = role;
		this.notice = notice;
	}
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getAccount() {
		return account;
	}
	public void setAccount(String account) {
		this.account = account;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getRole() {
		return role;
	}
	public void setRole(String role) {
		this.role = role;
	}
	public String getNotice() {
		return notice;
	}
	public void setNotice(String notice) {
		this.notice = notice;
	}
	
}
