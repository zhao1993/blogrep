package com.blog.action.photo;

import java.util.Set;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;

import com.blog.entity.Album;
import com.blog.entity.Photo;
import com.blog.service.AlbumService;

@Controller
public class AlbumDetailAction {
	@Resource AlbumService albumServiceImpl;
	
	private Set<Photo> photos;
	private Album album;
	private Integer id;
	public String execute(){
		album = albumServiceImpl.query(id);
		photos = album.getPhotos();
		return "success";
		
	}
	public Set<Photo> getPhotos() {
		return photos;
	}
	public void setPhotos(Set<Photo> photos) {
		this.photos = photos;
	}
	public Album getAlbum() {
		return album;
	}
	public void setAlbum(Album album) {
		this.album = album;
	}
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}

	
	
}
