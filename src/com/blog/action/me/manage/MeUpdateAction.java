package com.blog.action.me.manage;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;

import com.blog.entity.Me;
import com.blog.service.MeService;

@Controller
public class MeUpdateAction {
	@Resource MeService meServiceImpl;
	
	private Me me;
	public String execute(){
		me.setId(1);
		meServiceImpl.update(me);
		return "success";
	}
	public Me getMe() {
		return me;
	}
	public void setMe(Me me) {
		this.me = me;
	}
	
}
