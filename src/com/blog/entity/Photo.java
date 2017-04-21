package com.blog.entity;
// Generated 2017-4-21 20:11:15 by Hibernate Tools 4.0.0.Final

/**
 * Photo generated by hbm2java
 */
public class Photo implements java.io.Serializable {

	private Integer id;
	private Album album;
	private String image;
	private String note;
	private String content;
	private String type;
	private String notice;
	private String time;

	public Photo() {
	}

	public Photo(Album album, String image, String note, String content, String type, String notice, String time) {
		this.album = album;
		this.image = image;
		this.note = note;
		this.content = content;
		this.type = type;
		this.notice = notice;
		this.time = time;
	}

	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Album getAlbum() {
		return this.album;
	}

	public void setAlbum(Album album) {
		this.album = album;
	}

	public String getImage() {
		return this.image;
	}

	public void setImage(String image) {
		this.image = image;
	}

	public String getNote() {
		return this.note;
	}

	public void setNote(String note) {
		this.note = note;
	}

	public String getContent() {
		return this.content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getType() {
		return this.type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public String getNotice() {
		return this.notice;
	}

	public void setNotice(String notice) {
		this.notice = notice;
	}

	public String getTime() {
		return this.time;
	}

	public void setTime(String time) {
		this.time = time;
	}

}
