package com.blog.action.connect;

import java.util.List;

import javax.annotation.Resource;

import com.blog.entity.Connect;
import com.blog.service.ConService;
import org.springframework.stereotype.Controller;

@Controller
public class ConShowAction {
	@Resource ConService conServiceImpl;
	private List<Connect> connects;
	public String execute() throws Exception{
		connects = conServiceImpl.getConnects();
		return "success";
	}
	public List<Connect> getConnects() {
		return connects;
	}
	public void setConnects(List<Connect> connects) {
		this.connects = connects;
	}
}
