package com.blog.action.photo.manage;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;

import com.blog.service.AlbumService;

@Controller
public class AlbumDeleteAction {
	@Resource AlbumService albumServiceImpl;
	private Integer id;
	
	public String execute(){
		albumServiceImpl.delete(id);
		return "success";
		
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}
	
}
