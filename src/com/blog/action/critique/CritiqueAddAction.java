package com.blog.action.critique;


import javax.annotation.Resource;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.blog.entity.Critique;
import com.blog.entity.User;
import com.blog.service.CritiqueService;
import com.blog.service.UserService;
import com.blog.util.TimeUtil;
import com.opensymphony.xwork2.ActionSupport;

@Controller
@Scope("prototype")
public class CritiqueAddAction extends ActionSupport{
	@Resource CritiqueService critiqueServiceImpl;
	@Resource UserService userServiceImpl;
	private Critique critique;
	private Integer parentId;
	public String execute(){
		critique.setTime(TimeUtil.getNowTime());
		if(null!=parentId){
		Critique critique001 = critiqueServiceImpl.query(parentId);
		critique.setCritique(critique001);
		}
		//这里的id并非评论ID而是用户ID获取用户后需要删除id、否则报错
		//org.hibernate.PersistentObjectException: detached entity passed to persist
		if(null!=critique.getId()){
			User user = userServiceImpl.query(critique.getId());
			critique.setUser(user);
			critique.setId(null);
		}
		critiqueServiceImpl.save(critique);
		critique = null;
		return "success";
	}
	@Override
	public void validate() {
		super.validate();
		clearFieldErrors();
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
