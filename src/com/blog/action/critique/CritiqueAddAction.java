package com.blog.action.critique;


import javax.annotation.Resource;

import org.springframework.stereotype.Controller;

import com.blog.entity.Critique;
import com.blog.service.CritiqueService;
import com.blog.util.TimeUtil;

@Controller
public class CritiqueAddAction {
	@Resource CritiqueService critiqueServiceImpl;
	private Critique critique;
	
	public String execute(){
		critique.setTime(TimeUtil.getNowTime());
		critique.setType(CritiqueType.LAM.name());
		critiqueServiceImpl.save(critique);
		critique = null;
		return "success";
	}

	public Critique getCritique() {
		return critique;
	}

	public void setCritique(Critique critique) {
		this.critique = critique;
	}

	
}
