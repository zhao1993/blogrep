package com.blog.entity;

public class Photo {
	private Integer id;
	private String image;
	private String note;
	private String content;
	private String type;
	private String notice;
	private String time;
	private Album album;
	public Photo() {
		super();
	}
	public Photo(String image, String note, String content, String type,
			String notice, String time) {
		super();
		this.image = image;
		this.note = note;
		this.content = content;
		this.type = type;
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
	public String getNote() {
		return note;
	}
	public void setNote(String note) {
		this.note = note;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
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
	public String getTime() {
		return time;
	}
	public void setTime(String time) {
		this.time = time;
	}
	
	public Album getAlbum() {
		return album;
	}
	public void setAlbum(Album album) {
		this.album = album;
	}
	@Override
	public String toString() {
		return "Photo [id=" + id + ", image=" + image + ", note=" + note
				+ ", content=" + content + ", type=" + type + ", notice="
				+ notice + ", time=" + time + "]";
	}
	
}
