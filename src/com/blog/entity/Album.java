package com.blog.entity;

import java.util.Set;

public class Album {
	private Integer id;
	private String image;
	private String title;
	private String content;
	private String notice;
	private String time;
	private Set<Photo> photos;
	public Album() {
		super();
	}
	
	public Album(String image, String title, String content, String notice,
			String time) {
		super();
		this.image = image;
		this.title = title;
		this.content = content;
		this.notice = notice;
		this.time = time;
	}

	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getImage() {
		return image;
	}
	public void setImage(String image) {
		this.image = image;
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
	public String getNotice() {
		return notice;
	}
	public void setNotice(String notice) {
		this.notice = notice;
	}
	public String getTime() {
		return time;
	}
	public void setTime(String time) {
		this.time = time;
	}
	public Set<Photo> getPhotos() {
		return photos;
	}
	public void setPhotos(Set<Photo> photos) {
		this.photos = photos;
	}
	
}
