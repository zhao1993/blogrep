package com.blog.action.photo.manage;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;

import com.blog.service.PhotoService;

@Controller
public class PhotoDeleteAction {
@Resource PhotoService photoServiceImpl;
	
	private Integer id;
	public String execute(){
		photoServiceImpl.delete(id);
		return "success";
		
	}
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	
}
