package com.blog.action.critique;


import javax.annotation.Resource;

import org.springframework.stereotype.Controller;

import com.blog.entity.Critique;
import com.blog.service.CritiqueService;
import com.blog.util.TimeUtil;
import com.opensymphony.xwork2.ActionSupport;

@Controller
public class CritiqueAddAction extends ActionSupport{
	@Resource CritiqueService critiqueServiceImpl;
	private Critique critique;
	private Integer parentId;
	public String execute(){
		critique.setTime(TimeUtil.getNowTime());
		Critique critique001 = critiqueServiceImpl.query(parentId);
		critique.setCritique(critique001);
		critiqueServiceImpl.save(critique);
		System.out.println("CritiqueAddAction.execute()--->CritiqueType="+critique.getType());
		critique = null;
		return "success";
	}

	public Critique getCritique() {
		return critique;
	}

	public void setCritique(Critique critique) {
		this.critique = critique;
	}

	public Integer getParentId() {
		return parentId;
	}

	public void setParentId(Integer parentId) {
		this.parentId = parentId;
	}

	
}
