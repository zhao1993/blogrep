package com.blog.entity;

public class Me {
	private Integer id;
	private String name;
	private String content;
	private String notice;
	
	public Me() {
		super();
	}
	
	public Me(String name, String content, String notice) {
		super();
		this.name = name;
		this.content = content;
		this.notice = notice;
	}

	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getNotice() {
		return notice;
	}
	public void setNotice(String notice) {
		this.notice = notice;
	}
	
	
}
