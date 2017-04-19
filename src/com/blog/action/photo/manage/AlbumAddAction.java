package com.blog.action.photo.manage;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;

import com.blog.entity.Album;
import com.blog.service.AlbumService;
import com.blog.util.TimeUtil;

@Controller
public class AlbumAddAction {
@Resource AlbumService albumServiceImpl;
	private Album album;
	private String imagePath;
	
	public String execute(){
		album.setTime(TimeUtil.getNowTime());
		album.setImage("../"+imagePath);
		albumServiceImpl.save(album);
		album = null;
		return "success";
		
	}

	public Album getAlbum() {
		return album;
	}

	public void setAlbum(Album album) {
		this.album = album;
	}

	public String getImagePath() {
		return imagePath;
	}

	public void setImagePath(String imagePath) {
		this.imagePath = imagePath;
	}
	
	
}
