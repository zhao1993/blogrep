package com.blog.action.photo;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;

import com.blog.entity.Album;
import com.blog.service.AlbumService;

@Controller
public class AlbumShowAction {
	@Resource AlbumService albumServiceImpl;
	
	private List<Album> albums;
	public String execute(){
		
		albums = albumServiceImpl.getAlbums();
		return "success";
		
	}
	public List<Album> getAlbums() {
		return albums;
	}
	public void setAlbums(List<Album> albums) {
		this.albums = albums;
	}
	
}
