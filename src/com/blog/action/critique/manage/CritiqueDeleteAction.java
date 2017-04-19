package com.blog.action.critique.manage;


import javax.annotation.Resource;

import org.springframework.stereotype.Controller;

import com.blog.service.CritiqueService;

@Controller
public class CritiqueDeleteAction {
	@Resource CritiqueService critiqueServiceImpl;
	private int id;
	
	public String execute(){
		critiqueServiceImpl.delete(id);
		return "success";
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	
}
