package com.blog.action.photo.manage;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;

import com.blog.entity.Album;
import com.blog.entity.Photo;
import com.blog.service.AlbumService;
import com.blog.service.PhotoService;

@Controller
public class PhotoAddAction {
	@Resource PhotoService photoServiceImpl;
	@Resource AlbumService albumServiceImpl;
	
	private Photo photo;
	private Integer albumId;
	private String imagePath;
	public String execute(){
		Album album = albumServiceImpl.query(albumId);
		photo.setAlbum(album);
		photo.setImage("../"+imagePath);
		photoServiceImpl.save(photo);
		photo = null;
		return "success";
	}
	
	public Photo getPhoto() {
		return photo;
	}
	public void setPhoto(Photo photo) {
		this.photo = photo;
	}

	public Integer getAlbumId() {
		return albumId;
	}

	public void setAlbumId(Integer albumId) {
		this.albumId = albumId;
	}

	public String getImagePath() {
		return imagePath;
	}

	public void setImagePath(String imagePath) {
		this.imagePath = imagePath;
	}
	
}
