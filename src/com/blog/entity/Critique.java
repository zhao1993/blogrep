package com.blog.entity;

public class Critique {
	private Integer id;
	private String content;
	private String name;
	private String time;
	private String photo;
	private Integer articleId;
	private String type;
	private String notice;
	public Critique() {}
	
	public Critique(String content, String name, String time, String photo,
			Integer articleId, String type, String notice) {
		super();
		this.content = content;
		this.name = name;
		this.time = time;
		this.photo = photo;
		this.articleId = articleId;
		this.type = type;
		this.notice = notice;
	}

	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getTime() {
		return time;
	}
	public void setTime(String time) {
		this.time = time;
	}
	public String getPhoto() {
		return photo;
	}
	public void setPhoto(String photo) {
		this.photo = photo;
	}
	public Integer getArticleId() {
		return articleId;
	}
	public void setArticleId(Integer articleId) {
		this.articleId = articleId;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public String getNotice() {
		return notice;
	}
	public void setNotice(String notice) {
		this.notice = notice;
	}
	
}
