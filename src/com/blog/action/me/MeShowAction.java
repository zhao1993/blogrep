package com.blog.action.me;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;

import com.blog.entity.Me;
import com.blog.service.MeService;

@Controller
public class MeShowAction {
	@Resource MeService meServiceImpl;
	
	private Me me;
	public String execute(){
		me = meServiceImpl.query(1);
		return "success";
	}
	public Me getMe() {
		return me;
	}
	public void setMe(Me me) {
		this.me = me;
	}
	
}
